// import mysql from 'serverless-mysql'

// export const db = mysql({
//     config: {
//         host: '172.20.103.206',
//         user: 'rnotify',
//         password: 'rnotify',
//         port: 3306,
//         database: 'rnotify'
//     }
// })

const mysql = require('serverless-mysql');

exports.db = mysql({
    config: {
        host: '172.20.103.206',
        user: 'rnotify',
        password: 'rnotify',
        port: 3306,
        database: 'rnotify'
    }
})