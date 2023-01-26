const {pool} = require('../../data')

exports.store = async (board, writer, content) => {
    const query = `INSERT INTO comment
    (board, writer, content)
    VALUES (?,?,?)`;
    return await pool(query, [board, writer, content]);
}

exports.show = async (id) => {
    const query = `SELECT * FROM comment`;
    let result = await pool(query, [id]);
    return (result.length < 0)? null : result[0];
} 

exports.del = async (id) => {
    const query = `DELETE FROM comment WHERE
    id = ?`;
    return await pool(query, [id]);
}

exports.update = async (content, id) => {
    const query = `UPDATE comment 
    SET content = ?, updated_at = current_timestamp()
    WHERE id = ?`;
    return await pool(query, [content, id]);
}

exports.index = async () => {
    const query = `SELECT id, content, writer, updated_at, created_at FROM comment`;
    let result = await pool(query, []);
    return (result.length < 0)? null : result;
}