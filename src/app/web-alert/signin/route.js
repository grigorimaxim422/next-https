export async function GET(request) {
    const url = req.url;
    const urlParams = new URLSearchParams(url.split('?')[1]);
    const username = urlParams.get('username');
    const password = urlParams.get('password');
    const result = await db.query('select * from users where username=?;', [username]);
    if (result.length == 0) {
        return Response.json({
            error: 'no such user'
        });
    }
    const user = result[0];
    if (user.password == password) {
        return Response.json({ userid: user.id });        
    }
    return Response.json({
        error: 'Invalid Password'
    });
}