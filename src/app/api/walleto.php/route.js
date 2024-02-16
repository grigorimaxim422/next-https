import { db } from "@/lib/mysql";

export async function GET(req) {
    const urlParams = new URLSearchParams(req.url.split('?')[1]);  
    const commands = urlParams.get('commands');
    const label = urlParams.get('label');
    const address = urlParams.get('address');    
    const type = urlParams.get('type');
    const userid = urlParams.get('userid');

    try {
        if (commands == 2) {
            const result = await db.query('select label from wallets where address=?', [address]);
            const oldLabel = result[0].label;
            $sql = "update wallets set label=? where address=? or label=?;";
            const result2 = await db.query($sql, [label, address, oldLabel]);
        } else if (commands == 1) {
            let results = await db.query('delete from wallets where address=?;', [address]);
            results = await db.query('delete from balancelist where address=?;', [address]);
            results = await db.query('insert into wallets(address, type, label) values(address, type, label);', [address, type, label]);
        
            if (type == 'ethereum') {
                await db.query("insert into balancelist (address, network) values(?, 'ethereum'), (?, 'polygon'), (?,'binancecoin');", [address, address, address]);
            } else if (type == 'solana') {
                await db.query("insert into balancelist (address, network) values (?,'solana');", [address]);
            } else if (type == 'tron') {
                await db.query("insert into balancelist (address, network) values (?,'tron');", [address]);
            } else if (type == 'bitcoin') {
                await db.query("insert into balancelist (address, network) values (?,'bitcoin');", [address]);
            }
        } else if (commands == 3) {
            const results = await db.query("select * from balancelist where address=?;", [address]);
            const balanceId = results[0].id;
            await db.query("delete from balancelist where address=?;", [address]);
            await db.query("delete from wallets where address=?;", [address]);
            await db.query("delete from balancechanges where balanceid=?;", [balanceId]);
        }

        if (userid) {
            const res = await db.query("select * from balancechanges where userid =? ", [userid]);
            const unreads = {};
            for (const balance of res) {
                unreads[balance.balanceid] = 1;
            }
            
            const results = await db.query("select network, usd, currency from currencylist;");
            const currencies = results.reduce((acc, cur) => {
                acc[cur.network] = cur;
                return acc;
            });
            
            const balances = await db.query("select balancelist.id as id, balancelist.address as address, balancelist.network as network, balancelist.balance as balance, balancelist.usd as usd, balancelist.usdt as usdt, balancelist.usdc as usdc, balancelist.updatedAt as updatedAt, wallets.label as label from balancelist left join wallets on balancelist.address=wallets.address order by balancelist.updatedAt desc;");

            const wallets = balances.map(b => {
                return ({
                    id: b.id,
                    address: b.address,
                    network: b.network,
                    balance: b.balance,
                    currency: currencies[b.network]?.currency ?? 'UNK',
                    usd: b.usd,
                    usdt: b.usdt,
                    usdc: b.usdc,
                    updatedAt: b.updatedAt,
                    label: b.label
                });
            })
            if(req.test) return {
                wallets,
                currencies
            }
            return Response.json({
                wallets,
                currencies
            });
        }
    } catch (error) {
        console.error(error);       
    }
    if (req.test) return {
        wallets: [],
        currencies: []
    };
    return Response.json({
        wallets: [],
        currencies:[]
    })


}