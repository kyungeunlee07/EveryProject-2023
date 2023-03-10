const {insert, del, show } = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//친구 등록
exports.insert = async (ctx, next) => {

    let id = ctx.request.id.id;
    let {user_id} = ctx.request.body;

    let {affectedRows} = await insert(id, user_id);

    if(affectedRows> 0)
    {
        ctx.body = {result: "success"};
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//친구 삭제
exports.del = async (ctx, next) => {

    let {id} = ctx.request.body;

    let {affectedRows} = await del(id);

    if(affectedRows> 0)
    {
        ctx.body = {result: "success"};
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//친구 목록
exports.show = async (ctx, next) => {

    let id = ctx.request.id.id;

    let item = await show(id);
    
    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}