const {store, show, del, update, index} = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//전체 피드 리스트 
exports.index = async (ctx, next)=>{
    ctx.body = "피드 리스트";

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

//피드 수정
exports.update = async (ctx, next) => {
    let id = ctx.params.id;
    let {content, title} = ctx.request.body;
    let {affectedRows} = await update(content, id, title);

    if(affectedRows> 0)
    {
        ctx.body = `${id} 피드 수정`;
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//피드 삭제
exports.delete = async (ctx, next) => {
    let id = ctx.params.id;
    let {affectedRows} = await del(id);

    if(affectedRows > 0)
    {
        ctx.body = `${id} 피드 삭제`;
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//피드 작성
exports.store = async (ctx, next) => {
        // let token = await generteToken({name : 'my-name'});
    // ctx.body = token;
    let {id, title, content} = ctx.request.body;

    let {affectedRows} = await store(id, title, content);

    if(affectedRows> 0)
    {
        ctx.body = "피드 작성 완료";
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//피그 상세 페이지
exports.show = async (ctx, next) =>
{
    let id = ctx.params.id;
    let {title, content} = ctx.request.body;
    ctx.body = `${id} 피드 상세`;
    let item = await show(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = `${id} 피드 상세 ${item.content}`;
    }
}