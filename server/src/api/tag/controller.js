const {insert, check, show, show_count } = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//태그 추가
exports.insert = async (ctx, next) => {

    let {comment_id, friend} = ctx.request.body;

    let {affectedRows} = await insert(comment_id, friend);

    if(affectedRows> 0)
    {
        ctx.body = {result: "success"};
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

exports.check = async (ctx, next) => {

    let {id} = ctx.request.body;

    let {affectedRows} = await check(id);

    if(affectedRows> 0)
    {
        ctx.body = {result: "success"};
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

exports.show_count = async (ctx, next) => {

    let id = ctx.params.id;

    let {item} = await show_count(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}