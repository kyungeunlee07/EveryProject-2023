const {pool} = require('../../data')

//친구 추가
exports.insert =  async(user1_id, user2_id) => {
    const query = `INSERT INTO friends
    (user1_id, user2_id)
    VALUES(?, ?)`
    let result = await pool(query, [user1_id, user2_id]);
    return { affectedRows : result.affectedRows};
}


//친구 끊기
exports.del = async(id) => {
    const query = `DELETE FROM friends
    WHERE id = ?`
    let result = await pool(query, [id]);
    return { affectedRows : result.affectedRows};
}

// 친구 리스트
exports.show = async(id) => {
    const query = `SELECT id, name, sid, department, email FROM member WHERE id IN
    ((SELECT user1_id as friend FROM friends WHERE user2_id = ? )
    UNION ALL
    (SELECT user2_id as friend FROM friends WHERE user1_id = ?))`
    let result = await pool(query, [id, id]);
    return (result.length == 0)? null : result;
}

