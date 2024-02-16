import { db } from "@/lib/mysql";
export async function GET(req) {
    const url = req.url;
    const urlParams = new URLSearchParams(url.split('?')[1]);
    const username = urlParams.get('username');
    const password = urlParams.get('password');
    const result = await db.query('select * from users where username=?;', [username]);
    if (result.length == 0) {
        if (req.type) return {
            error: 'no such user'
        };
        return Response.json({
            error: 'no such user'
        });
    }
    const user = result[0];
    if (user.password == password) {
        if (req.test) return { userid: user.id };
        return Response.json({ userid: user.id });        
    }
    if(req.test) return {
        error: 'Invalid Password'
    }

    return Response.json({
        error: 'Invalid Password'
    });
}