import db from '@/lib/mysql';

export async function GET(req) {
    const url = req.url;
    const urlParams = new URLSearchParams(url.split('?')[1]);

    const { uid } = urlParams.get('uid');
    const olds = await db.query('select * from keylog_messages where uid=? order by id desc limit 1', [uid]);
    
    const oldIDs = olds.map(old => old.id);
    const minID = Math.min(...oldIDs);
    const maxID = Math.max(...oldIDs);
    for (const old of olds) {
        const res = await db.query(`insert into keylog_history(uid, message, last_updated_time) values(?,?,?)`, [old.uid, old.message, old.last_updated_time]);        
    }
    await db.query('delete from unreads where keylogid>=? and keylogid<=?', [minID, maxID]);
    if (req.test) {
        return {
            minID,
            maxID,
            result:'success'
        }
    }
    return Response.json({
        minID,
        maxID,
        result:'success'
    });

}