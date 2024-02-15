import migrate2History from "./migrate2History";

export async function POST(request) {
    const { taskId, taskName } = await request.json()
    const timeoverLimit = process.env.TIMEOVER_LIMIT || 12;
    
    if (timeId == 1) {
        const res = await migrate2History();
        return res;
    }
    
    return Response.json({
        taskId,
        taskName,
        timeoverLimit,
        result: 'success',
    });
}