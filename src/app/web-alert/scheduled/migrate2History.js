import db from '@/lib/mysql';
export default async function () {
    const timeOverLimit = process.env.TIMEOVER_LIMIT || 12;
    const sql = `SELECT * from users WHERE last_updated_time < NOW() - INTERVAL ${timeOverLimit} HOUR order by last_updated_time desc limit`;
    
    const olds = await db.query(sql);
    const oldIDs = olds.map(old => old.id);
    const minID = Math.min(...oldIDs);
    const maxID = Math.max(...oldIDs);
    for (const old of olds) {
        const res = await db.query(`insert into keylog_history(uid, message, last_updated_time) values(?,?,?)`, [old.uid, old.message, old.last_updated_time]);        
    }
    await db.query('delete from unreads where keylogid>=? and keylogid<=?', [minID, maxID]);
    return Response.json({
        minID,
        maxID,
        result:'success'
    });
}