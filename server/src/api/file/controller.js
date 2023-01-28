const {pool} = require('../../data')
const fs = require('fs');
const { create, show } = require('./query');

exports.upload = async ctx => {
    let file = ctx.request.file;
    
    let {affectedRows, insertId} = await create(file.originalname, file.path, file.size);

    if(affectedRows > 0)
    {
        ctx.body = {result : "ok", id: insertId}

    }
    else{
        ctx.body = {result : "fail",}
    }
    // const query = `INSERT INTO files
    // (original_name, file_path, file_size)
    // VALUES (?,?,?)`;

    // let {affectedRows, insertId} = await pool(query, [file.originalname, file.path, file.size]);
    // if(affectedRows> 0)
    // {
    //     ctx.body = {
    //         result: "ok",
    //         id: insertId
    //     }
    // }else{
    //     ctx.body = {
    //         result: 'fail',
    //     }
    // }
 


    //ctx.body = file;
}


exports.download = async ctx => {
    let {id} = ctx.params;

    let item = await show(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
        return;
    }


    // const query = `SELECT * FROM files WHERE id = ?`;
    // let result = await pool(query, [id]);

    // if(result.length < 1)
    // {
    //     ctx.bodt = {result: "fail"};
    //     return;
    // }
    // let item = result[0];

    ctx.response.set("content-disposition", `attachment; filename=${item.original_name}`);
    ctx.statusCode = 200;
    ctx.body = fs.createReadStream(item.file_path);
}