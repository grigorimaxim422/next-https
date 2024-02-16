import React, {useEffect, useRef} from 'react';
import { useBotsContext } from '../../lib';
import { Table } from 'react-bootstrap';
import { useState } from 'react';
const BotMessageList = () => {
    const {selectedBot, botMessages = [], keyword, getAllMessages } = useBotsContext();
    const [expanded, setExpended] = useState(false);
    const tableRef = useRef(null);
     
    useEffect(() => {
        if (tableRef != null && botMessages != null) {
            tableRef.current.scrollTop = 0;
        }
        console.log({ botMessages });
    }, [botMessages, keyword, tableRef]);

    useEffect(() => {
        setExpended(false);
    }, [selectedBot]);
    
    const botMessages2 = botMessages?.filter(elem => {
        return elem.message?.toLowerCase().includes(keyword.toLowerCase());
    });            
    const handleMore = () => {            
        getAllMessages();
        setExpended(true);
    }

    return (
        <div className='main-content'  ref={tableRef}>
            <Table className="table-sm" style={{overflowWrap:'anywhere'}}>
                <thead>
                    <tr>
                    <th style={{width:'5%'}}>
                        No                        
                    </th>
                    <th style={{width:'75%'}}>
                        Message
                    </th>
                    <th style={{width:'20%'}}>
                            Report Time &nbsp;
                          
                    </th>
                    </tr>
                </thead>
                <tbody>
                    {
                        botMessages2.map((msg,idx) => (
                            <MessageTableRow key={msg.id} data={msg} index={idx}/>
                        ))
                    }
                </tbody>
            </Table>      
            <button className="btn btn-sm btn-primary btn-fixed" onClick={handleMore} disabled={expanded}>
                Read More
            </button>
        </div>
    )
}

const MessageTableRow = ({ data, index = 0 }) => {
    const message = data.message;
    
    return (
        <tr style={{height:'2rem',wordWrap: 'break-word'}}>
            <td>
                {index+1}
            </td>
            <td>                
                    {
                        message.split('[next]').map(d => (
                            <p key={d} style={{margin:'0', padding:'0'}}>{d}</p>
                        ))
                    }                  
                
            </td>
            <td>
                {data.last_updated_time}
            </td>
        </tr>
    )
}
export default BotMessageList