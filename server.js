const { createServer } = require('https');
const mysql = require('serverless-mysql');
const http = require('http');
const { parse } = require('url')
const next = require('next');
const fs = require('fs');
const path = require('path');

require('dotenv').config();

const options = {
    key: fs.readFileSync(path.join(__dirname, 'certificates', 'private.key')),
    cert: fs.readFileSync(path.join(__dirname, 'certificates', 'certificate.crt')),
    ca: fs.readFileSync(path.join(__dirname, 'certificates', 'ca_bundle.crt')),
}

const PORT = process.env.PORT || 3000;
const dev = true;
const app = next({ dev });
const handle = app.getRequestHandler();

app.prepare().then(() => {
    createServer(options, async (req, res) => {
        const parsedUrl = parse(req.url, true);
        await handle(req, res, parsedUrl);
        
    }).listen(PORT, (err) => {
        if (err) {
            console.error(err);
            return err;
        }
        console.log(`Application starts at https://localhost:${PORT}/`)
    });
    http.createServer( async (req, res) => {
        const parsedUrl = parse(req.url, true);
        await handle(req, res, parsedUrl);
    }).listen(3001, (err) => {
        if (err) {
            console.error(err);
            return err;
        }
        console.log(`Application starts at http://localhost:${PORT}/`)
        setInterval(() => {
            console.log('running a task every 10 seconds');
            performMigrateHere().then((res) => {
                console.log('performMigrateHere task done: ', res);
            });
            // fetch(`http://localhost:3001/api/scheduled.php?taskId=1&taskName=migrate`)
            //     .then(response => {
            //         if (!response.ok) {
            //             throw Error(response.statusText);
            //         }
            //         return response.json();
            //     })
            //     .then(response => {
            //     console.log('Scheduled task response:'+ JSON.stringify(response));
            // });
        }, 10000);
    });
})
async function performMigrateHere() {
    
    const db = mysql({
        config: {
            host: '172.20.103.206',
            user: 'rnotify',
            password: 'rnotify',
            port: 3306,
            database: 'rnotify'
        }
    });
    const timeOverLimit = process.env.TIMEOVER_LIMIT || 48;
    try {
        const sql = `SELECT * from keylog_messages WHERE last_updated_time < NOW() - INTERVAL ${timeOverLimit} HOUR order by last_updated_time desc `;
    
        const olds = await db.query(sql);
        let minID = 0, maxID = 0;
        if (olds.length > 0) {
            const oldIDs = olds.map(old => old.id);

             minID = Math.min(...oldIDs);
             maxID = Math.max(...oldIDs);
            for (const old of olds) {
                const res = await db.query(`insert into keylog_history(uid, message, last_updated_time) values(?,?,?)`, [old.uid, old.message, old.last_updated_time]);
            }
            await db.query('delete from unreads where keylogid>=? and keylogid<=?', [minID, maxID]);
            await db.query('delete from keylog_messages where id>=? and id<=?', [minID, maxID]);
        }
        return ({
            minID,
            maxID,
            timeOverLimit,
            result:'success'
        });
    } catch (error) {
        console.error(error);
        return ({
            taskId,
            taskName,
            timeOverLimit,
            result: 'error',
            error:JSON.stringify(error)
        });
    }
}
