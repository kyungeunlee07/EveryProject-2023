const {store, show, del, update, index, depart_show} = require('./query');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

//전체 피드 리스트 
exports.show = async (ctx, next)=>{
    ctx.body = "전체 피드 리스트";
    let item = await show();

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result: "success", items: item};
    }
}

//학과별 피드 리스트
exports.depart_show = async (ctx, next)=>{
    ctx.body = "학과별 피드 리스트";
    let {department} = ctx.request.body;
    let item = await depart_show(department);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result: "학과별 피드 리스트", items: item};
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
    //타인이 수정할 경우
    if(id !== item.id) {
        ctx.status = 400;
        ctx.body = {result: "fail", message: '자기가 쓴 글만 수정할 수 있습니다. '};
        return;
      }
}

//피드 삭제
exports.delete = async (ctx, next) => {
    let id = ctx.params.id;
    let {affectedRows} = await del(id);

    if(affectedRows > 0)
    {
        ctx.body = `${id} 피드 삭제 완료!`;
    }
    else
    {
        ctx.body = {result:"fail"};
    }
    //타인이 삭제할 경우
    if(id !== item.id) {
        ctx.status = 400;
        ctx.body = {result: "fail", message: '자기가 쓴 글만 삭제할 수 있습니다. '};
        return;
      }
}

//피드 작성하기
exports.store = async (ctx, next) => {
    // 글쓴이, 글 제목, 글 내용
    // 사용자에게 받아와야하는거: 글 제목, 글 내용을 받아와서 db에 저장
    // 글쓴이없어 => 사용자의 아이디: member.id(rladuswls) => 따로 쿼리문이 필요하다? 아이디를 뜨게할거냐, 실명을 뜨게 할거냐
    // let token = await generteToken({name : 'my-name'});
    // ctx.body = token;
    let writer = ctx.request.decoded.id;
    console.log(writer)
    let {title, content} = ctx.request.body;
    let {affectedRows} = await store(title, content, writer);
    
    if(affectedRows> 0)
    {
        ctx.body = "피드 작성 완료!";
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//피드 상세 페이지 & 댓글 
exports.index = async (ctx, next) =>
{
    let id = ctx.params.id;
    let item = await index(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result: "상세 페이지", items: item};
    }
}