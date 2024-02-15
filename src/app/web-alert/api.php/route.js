import { db } from '@/lib/mysql';
// export default async (req, res) => {
//     // Get the value of a specific parameter
//     const paramName = req.query;
//     const result= await db.query('SELECT NOW()')  
//     // Use the parameter in the API route logic
//     // ...
  
//     // Send a response
//     res.status(200).json({ query:req.query, result });
//   };
export async function GET(req) {
    const url = req.url;
    // const time = await db.query('SELECT NOW()')
    const urlParams = new URLSearchParams(url.split('?')[1]);
    // const params = request;
    const params = urlParams.values();
    const uid = urlParams.get('uid');
    const info = urlParams.get('status');
    const result = await db.query('insert into keylog_messages (uid, message) values (?,?)', [uid, info]);
    const keylogId = result.insertId;    
    const users = await db.query('select * from users');
    for (const user of users) {
        await db.query('insert into unreads(uid, keylogid, userid) values(?,?,?)', [uid, keylogId, user.id]);
    }
    
    // const { nombre, descripcion, precio } = await request.json()

    // const result = await db.query('insert into articulos set ?', {
    //     nombre, descripcion, precio
    // })

    // return NextResponse.json({ id: result.insertId, nombre, descripcion, precio })

    return Response.json({
        msg:'okay'
    });
    // // console.log(result);
    // return Response.json({
    //     now: result[0],
    //     request
    // })
    
}