/** @type {import('next').NextConfig} */
const dotenv = require('dotenv');
const cron = require('node-cron');
const axios = require('axios');
const https = require('https');
dotenv.config();
cron.schedule('*/30 * * * * *', async () => {

    const baseURL = process.env.REACT_APP_API_URL;
    console.log('running a task every  minute');
    console.log('process.env.URL=', baseURL);
    // const api = axios.create({
    //     baseURL,
    //     headers: {
    //         'Content-Type': 'application/json'
    //     }
    // });

    // try {
    //     const response = await api.post('/scheduled.php' < {
    //         taskId: 1,
    //         taskName: 'migrate'
    //     });
    //     console.log('Scheduled task response: ' + JSON.stringify(response));
    // } catch (error) {
    //     console.error('fetchData in next.config.js error:', error);
    // }
    const url = `${baseURL}/scheduled.php`;
    // const url = 'api/scheduled.php';
    // axios({

    //     method: 'post',
    //     url,
        // data: {
        //     taskId: 1,
        //     taskName: 'migrate'
        // },
        
    // }).then(response => {
    //     console.log('Scheduled task response:'+ JSON.stringify(response));
    // });
    console.log('url=', url);
    const agent = new https.Agent({ rejectUnauthorized: false });
    const data = {
        taskId: 1,
        taskName: 'migrate'
    };
    try {
        axios.post(url, data, { httpsAgent: agent }).then(response => {
            console.log('response.status = ', response.status);
            console.log('response.data= ', response.data);
        });
    } catch (error) {
        console.log('Scheduled task error: ', error);
    }
});
const nextConfig = {}

module.exports = nextConfig
