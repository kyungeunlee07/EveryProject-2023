const jwt = require('jsonwebtoken');
const {register, login, del} = require('./query');
const crypto = require('crypto');

exports.info = (ctx, next) => {
    let id = ctx.params.id;
    ctx.body = `${id} 회원에 대한 정보`;
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
        let token = await generteToken({name});
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
        ctx.body = {result: "fail"};
    }
    else
    {
        let token = {result : "success"};
        ctx.body = token;
    }

}

//삭제
exports.del = async (ctx, next) => {

    let id = ctx.params.id;

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



let generteToken = (payload)=>{
    return new Promise((resolve, reject)=> {
        jwt.sign(payload, process.env.APP_KEY, (error, token) => {
            if(error) {reject(error);}
            resolve(token);
        })
    })
}