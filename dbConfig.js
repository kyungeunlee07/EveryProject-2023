const { json } = require('body-parser');
const fs = require('fs');

const data = fs.readFileSync('./database.json');
const conf = JSON.parse(data);
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host:conf.host,
    user:conf.user,
    password:conf.password,
    port:conf.port,
    database:conf.database
}) //보안을 위해서 database.json에 있는 내용을 conf. 로 대신 써줌


connection.connect();

module.exports = connection //mysql이랑 연결 시켜준거 자체를 exports함