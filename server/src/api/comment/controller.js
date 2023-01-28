const {store, del, update} = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//댓글 수정하기
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

     //타인이 댓글을 수정할 경우
     if(id !== item.id) {
        ctx.status = 400;
        ctx.body = {result: "fail", message: '자기가 쓴 댓글만 삭제할 수 있습니다.'};
        return;
      }
}

//댓글 삭제하기
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

     //타인이 댓글을 삭제할 경우
     if(id !== item.id) {
        ctx.status = 400;
        ctx.body = {result: "fail", message: '자기가 쓴 글만 삭제할 수 있습니다. '};
        return;
      }
}

//댓글 작성하기
exports.store = async (ctx, next) => { 
    // let token = await generteToken({name : 'my-name'});
    // ctx.body = token;
    let writer = "rladuswls010";
    console.log(writer);
    let board = 1;
    let {content} = ctx.request.body;
    let {affectedRows} = await store(board, writer, content);

    if(affectedRows> 0)
    {
        ctx.body = "댓글 작성 완료";
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

