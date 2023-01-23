const {store, show, del, update, index} = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

exports.index = async (ctx, next)=>{
    ctx.body = "댓글 목록";
    let item = await index();

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result: "success", items: item};
    }
}

exports.update = async (ctx, next) => {
    let id = ctx.params.id;
    let {content} = ctx.request.body;
    let {affectedRows} = await update(content, id);

    if(affectedRows> 0)
    {
        ctx.body = `${id} 댓글 수정`;
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

exports.delete = async (ctx, next) => {
    let id = ctx.params.id;
    let {affectedRows} = await del(id);

    if(affectedRows> 0)
    {
        ctx.body = `${id} 댓글 삭제`;
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

exports.store = async (ctx, next) => {
    // let token = await generteToken({name : 'my-name'});
    // ctx.body = token;
    let {id, content} = ctx.request.body;
    let {affectedRows} = await store(id, content);

    if(affectedRows> 0)
    {
        ctx.body = "댓글 작성 완료";
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

