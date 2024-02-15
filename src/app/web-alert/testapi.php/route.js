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
    
    const result = await db.query('SELECT NOW()')
    const url = req.url;
    const urlParams = new URLSearchParams(url.split('?')[1]);
    // const params = request;
    const params = urlParams.values();
    const hello = urlParams.get('hello');
    const orange = urlParams.get('orange');
    for (const p of urlParams) {
        console.log(p);
    }
    
    return Response.json({
        params,
        url,
        orange,
        hello,
        result
    });
    // // console.log(result);
    // return Response.json({
    //     now: result[0],
    //     request
    // })
    
}