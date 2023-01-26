const {pool} = require('../../data')


//친구요청 추가
exports.insert = async (sender_id, receiver_id) => {
    const query = `INSERT INTO friend_request
    (sender_id, receiver_id)
    VALUES (?,?)`;
    let result = await pool(query, [sender_id, receiver_id]);
    return { affectedRows : result.affectedRows};
}


//친구 요청 거부
exports.del = async(id) => {
    const query = `DELETE FROM friend_request
    WHERE id = ?`
    let result = await pool(query, [id]);
    return { affectedRows : result.affectedRows};
}


// 자신의 친구 요청 받은 리스트
exports.show_request_received = async(id) => {
    const query = `SELECT * FROM (SELECT id, name, sid, department, email FROM member) AS tbl WHERE id IN (SELECT sender_id FROM friend_request WHERE receiver_id = ?)`
    let result = await pool(query, [id]);
    return (result.length == 0)? null : result;
}

// 자신의 친구 요청 신청한 리스트
exports.show_request_sent = async(id) => {
    const query = `SELECT * FROM (SELECT id, name, sid, department, email FROM member) AS tbl WHERE id IN (SELECT receiver_id FROM friend_request WHERE sender_id = ?)`
    let result = await pool(query, [id]);
    return (result.length == 0)? null : result;
}
