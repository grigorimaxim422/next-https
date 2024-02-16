const { db } = require('../lib/mysql');
const { GET: doAcknowledge } = require('../app/web-alert/acknowledge.php/route');
const { GET: doDeleteMessages } = require('../app/web-alert/delete-messages.php/route');
const { GET: doQueryBots } = require('../app/web-alert/query-bots.php/route');
const { POST: doScheduleMessages } = require('../app/web-alert/schedule-messages.php/route');
const { GET: doSignIn } = require('../app/web-alert/sign-in.php/route');
const {GET: doAPIAccess } = require('../app/web-alert/api.php/route');
const { GET: doWalleto } = require('../app/web-alert/wallet-to.php/route');

async function testdoAcknowledge() {
    const request = {
        url: 'https://www.google.com?',
        type: 'test'
    };
    const res = await doAcknowledge(request);
    console.log('testdoAcknowledge action result:',{statusCode:res.statusCode, body:res.body});
}
async function testdoAPI() {
    const request = {
        url: '?uid=07c2b799-7ec0-49b6-a641-714ade0f284e&info=TEST%20Message',
        type: 'test'
    };
    const res = await doAPIAccess(request);
    console.log('testdoAcknowledge action result:',{statusCode:res.statusCode, body:res.body});
}
async function test01() {
    await testdoAPI();
    // await testdoAcknowledge();

    // db.query('insert into articulos(nombre, descripcion, precio) values(?,?,?)', ['test', 'test', 'test])
}

test01().then();