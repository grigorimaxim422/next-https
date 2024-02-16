/** @type {import('next').NextConfig} */
const dotenv = require('dotenv');
const cron = require('node-cron');
const axios = require('axios');
dotenv.config();
cron.schedule('*/30 * * * * *', async () => {

    const baseURL = process.env.REACT_APP_API_URL;
    console.log('running a task every two minutes');
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
    // const url = `${baseURL}/scheduled.php`;
    // axios({

    //     method: 'post',
    //     url,
    //     data: {
    //         taskId: 1,
    //         taskName: 'migrate'
    //     }
    // }).then(response => {
    //     console.log('Scheduled task response:'+ JSON.stringify(response));
    // });

    // fetch(`http://localhost:3001/api/scheduled.php?taskId=1&taskName=migrate`).then(response => {
    //     console.log('Scheduled task response:'+ JSON.stringify(response));
    // });
});
const nextConfig = {}

module.exports = nextConfig
