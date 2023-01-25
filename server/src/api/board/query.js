const {pool} = require('../../data')

//학과 전체 보기
exports.index = async () => {
    const query = `SELECT * FROM board`;
    let result = await pool(query, []);
    return (result.length < 0)? null : result;
}

