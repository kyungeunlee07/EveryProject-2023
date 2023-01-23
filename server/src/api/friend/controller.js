const {insert, del, show } = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//친구 등록
exports.insert = async (ctx, next) => {

    let {user1_id, user2_id} = ctx.request.body;

    let {affectedRows} = await insert(user1_id, user2_id);

    if(affectedRows> 0)
    {
        ctx.body = {result: "success", values: affectedRows};
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
        ctx.body = {result: "success", values: affectedRows};
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

exports.show = async (ctx, next) => {

    let id = ctx.params.id;

    let {item} = await show(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}