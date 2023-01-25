const {pool} = require('../../data')

exports.info = async (id) => {
    const query = `SELECT id, name, sid, department, email
    FROM member WHERE id = ?`;
    let result = await pool(query, [id]);
    return (result.length == 0)? null : result;
}

exports.register = async (id, pw, name, sid, department, email) => {
    const query = `INSERT INTO member
    (id, pw, name, sid, department, email)
    VALUES (?,?,?,?,?,?)`;
    return await pool(query, [id, pw, name, sid, department, email]);
}

exports.login = async (id, pw) => {
    const query = `SELECT id, name, sid, department, email FROM member WHERE
    id = ? AND pw = ?`;
    let result = await pool(query, [id,pw]);
    return (result.length == 0)? null : result
}

exports.del = async (id) => {
    const query = `DELETE FROM member WHERE
    id = ?`;
    let result = await pool(query, [id]);
    return { affectedRows : result.affectedRows};
}

exports.show_intro = async (id) => {
    const query = `SELECT introduction
    FROM member WHERE id = ?`;
    let result = await pool(query, [id]);
    return (result.length == 0)? null : result;
}

exports.update_intro = async (id, introduction) => {
    const query = `UPDATE member SET introduction = ? WHERE
    id = ?`;
    let result = await pool(query, [introduction, id]);
    return { affectedRows : result.affectedRows};
}