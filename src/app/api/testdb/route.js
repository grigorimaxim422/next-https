import { db } from '@/lib/mysql';

export async function GET () {
    const result= await db.query('SELECT NOW()')
    // console.log(result);
    return Response.json(result[0])
}