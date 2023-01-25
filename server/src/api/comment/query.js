const {pool} = require('../../data')

//댓글 작성
exports.store = async (id, content) => {
    const query = `INSERT INTO comment
    (id, content), created_at = current_timestamp()
    VALUES (?,?)`;
    return await pool(query, [id, content]);
}

// //전체 댓글 보기
// exports.show = async (id) => {
//     const query = `SELECT * FROM comment`;
//     let result = await pool(query, [id]);
//     return (result.length < 0)? null : result[0];
// } 

//댓글 삭제
exports.del = async (id) => {
    const query = `DELETE FROM comment WHERE
    id = ?`;
    return await pool(query, [id]);
}

//댓글 수정
exports.update = async (content, id) => {
    const query = `UPDATE comment 
    SET content = ?, updated_at = current_timestamp()
    WHERE id = ?`;
    return await pool(query, [content, id]);
}

//댓글 전체 보기
exports.index = async () => {
    const query = `SELECT id, content, writer, updated_at, created_at FROM comment`;
    let result = await pool(query, []);
    return (result.length < 0)? null : result;
}