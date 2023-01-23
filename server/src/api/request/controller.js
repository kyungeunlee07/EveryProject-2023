const {insert, del, show_request_received, show_request_sent } = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//친구 신청 추가
exports.insert = async (ctx, next) => {

    let {sender_id, receiver_id} = ctx.request.body;

    let {affectedRows} = await insert(sender_id, receiver_id);

    if(affectedRows> 0)
    {
        ctx.body = {result: "success"};
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}


//친구 신청 삭제, 거부
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


//친구요청 받은 목록
exports.show_request_received = async (ctx, next) => {

    let id = ctx.params.id;

    let {item} = await show_request_received(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}


//친구요청 신청 목록
exports.show_request_sent = async (ctx, next) => {

    let id = ctx.params.id;

    let {item} = await show_request_sent(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}
