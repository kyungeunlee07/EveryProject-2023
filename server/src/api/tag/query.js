const {pool} = require('../../data')


//친구요청 추가
exports.insert = async (comment_id, friend) => {
    const query = `INSERT INTO tag
    (comment_id, friend)
    VALUES (?,?)`;
    let result = await pool(query, [comment_id, friend]);
    return { affectedRows : result.affectedRows};
}


// 태그 불러오기
exports.show = async(id) => {
    const query = `SELECT l.comment_id AS comment_id, l.board_id AS board_id, l.comment_name AS comment_name, l.comment_content AS comment_content, r.m_name AS board_name, b_title AS board_title 
    FROM (SELECT c.id AS comment_id, c.board AS board_id, c.name AS comment_name, c.content AS comment_content FROM (SELECT * FROM tag WHERE friend = ?) AS t 
    LEFT JOIN (SELECT member.name AS name, comment.id AS id, comment.board AS board, comment.content AS content, comment.writer AS writer FROM comment LEFT JOIN member ON comment.writer = member.id) AS c ON t.comment_id = c.id)
    AS l LEFT JOIN (SELECT member.name AS m_name, board.title AS b_title, board.id AS b_id FROM board LEFT JOIN member ON board.writer = member.id) AS r ON l.board_id = r.b_id`
    let result = await pool(query, [id]);
    return (result.length < 0)? null : { item : result};
}

// 읽기 않은 태그의 수
exports.show_count = async(id) => {
    const query = `SELECT COUNT(*) AS cnt FROM tag WHERE friend = ? AND checked = 0 GROUP BY friend`
    let result = await pool(query, [id]);
    return (result.length < 0)? null : { item : result};
}

// 태그를 확인하면 checked를 0에서 1로 변경한다
exports.check = async(id) => {
    const query = `UPDATE tag SET checked = 1 WHERE id = ?`
    let result = await pool(query, [id]);
    return { affectedRows : result.affectedRows};
}
