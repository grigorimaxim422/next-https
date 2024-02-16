import {db} from '@/lib/mysql';
export async function POST(request) {
    const { taskId, taskName } = await request.json()    
    
    if (taskId == 1) {
        const res = await migrate2History(taskId, taskName);
        return res;
    }
    if(request.test) return {
        taskId,
        taskName,        
        result: 'success',
    }
    
    return Response.json({
        taskId,
        taskName,    
        result: 'success',
    });
}
async function migrate2History(taskId, taskName) {
    const timeOverLimit = process.env.TIMEOVER_LIMIT || 48;
    try {
        const sql = `SELECT * from keylog_messages WHERE last_updated_time < NOW() - INTERVAL ${timeOverLimit} HOUR order by last_updated_time desc `;
    
        const olds = await db.query(sql);
        const oldIDs = olds.map(old => old.id);
        const minID = Math.min(...oldIDs);
        const maxID = Math.max(...oldIDs);
        for (const old of olds) {
            const res = await db.query(`insert into keylog_history(uid, message, last_updated_time) values(?,?,?)`, [old.uid, old.message, old.last_updated_time]);
        }
        await db.query('delete from unreads where keylogid>=? and keylogid<=?', [minID, maxID]);
        await db.query('delete from keylog_messages where id>=? and id<=?', [minID, maxID]);
        return Response.json({
            minID,
            maxID,
            timeOverLimit,
            result:'success'
        });
    } catch (error) {
        console.error(error);
        return Response.json({
            taskId,
            taskName,
            timeOverLimit,
            result: 'error',
            error:JSON.stringify(error)
        });
    }
   
}