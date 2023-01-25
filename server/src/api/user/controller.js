const jwt = require('jsonwebtoken');
const {register, login, del, info} = require('./query');
const crypto = require('crypto');
const GetIntrinsic = require('get-intrinsic');

exports.info = async (ctx, next) => {
    let {id} = ctx.request.body;

    let {item} = await info(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}



//회원가입
exports.register = async (ctx, next) => {
    // let token = await generteToken({name : 'my-name'});
    // ctx.body = token;
    let {id, pw, name, sid, department, email} = ctx.request.body;
    let result = await crypto.pbkdf2Sync(pw, process.env.APP_KEY, 50, 100, 'sha512')

    let {affectedRows} = await register(id, result.toString('base64'), name, sid, department, email);

    if(affectedRows> 0)
    {
        let token = await generteToken({name, id: insertId});
        ctx.body = {result: "success", id: id};
    }
    else
    {
        ctx.body = {result:"fail"};
    }
}

//로그인
exports.login = async (ctx, next) => {

    let {id, pw} = ctx.request.body;
    let result = await crypto.pbkdf2Sync(pw, process.env.APP_KEY, 50, 100, 'sha512')

    let item = await login(id, result.toString('base64'));

    if(item == null)
    {
        ctx.body = {result: "아이디 혹은 비밀번호가 맞지 않습니다."};
    }
    else
    {
        let token = await generateToken({name: item.name, id: item.id});
        ctx.body = token;
    }

}

//삭제
exports.del = async (ctx, next) => {

    let {id} = ctx.request.body;

    let {affectedRows} = await del(id);

    if(affectedRows > 0)
    {
        ctx.body = {result: "success"};
    }
    else
    {
        ctx.body = {result: "fail"};
    }

}

//페이로드 토큰 생성
let generteToken = (payload)=>{
    return new Promise((resolve, reject)=> {
        jwt.sign(payload, process.env.APP_KEY, (error, token) => {
            if(error) {reject(error);}
            resolve(token);
        })
    })
}
