const {pool} = require('../../data')

//피드 작성하기
exports.store = async (title, content, writer) => {
    const query = `INSERT INTO board(title, content, writer, department) 
    VALUES(?,?,?,(SELECT department FROM member WHERE id = ?))`;
    return await pool(query, [title, content, writer, writer]);
}

//전체글 보기
exports.show = async () => {
    const query = `SELECT * FROM board WHERE department = '전체'`;
    let result = await pool(query, []);
    return(result.length == 0)? null : result[0]
}

//학과별 글 보기
exports.depart_show = async (department) => {
    const query = `SELECT * FROM board WHERE
    department = ?`;
    let result = await pool(query, [department]);
    return (result.length < 0)? null : result[0];
}

//피드 삭제하기
exports.delete = async (id) => {
    const query = `DELETE FROM board WHERE
    id = ?`;
    return await pool(query, [id]);
}

//피드 수정하기
exports.update = async (content, id, title, writer) => {
    const query = `UPDATE board 
    SET content = ?, updated_at = current_timestamp()
    WHERE
    id = ?`;
    return await pool(query, [content, id, title, writer]);
}

//피드 상세 페이지 & 댓글
exports.index = async (id) => {
    const query = `SELECT '게시글' AS '구분', id, title, content, writer, created_at, updated_at FROM board WHERE id = ?
    UNION ALL
    SELECT '댓글' AS '댓글', id, '' AS title, content, writer, created_at, updated_at FROM comment
    WHERE board = ?`;
    let result = await pool(query, [id, id]);
    return (result.length < 0)? null : result;
}
