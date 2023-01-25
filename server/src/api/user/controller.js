const jwt = require('jsonwebtoken');
const {register, login, del, info, show_intro, update_intro} = require('./query');
const crypto = require('crypto');

exports.info = async (ctx, next) => {
    let {id} = ctx.request.body;

    let item = await info(id);

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
        let token = {result : "success", values: item};
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

exports.show_intro = async (ctx, next) => {
    let {id} = ctx.request.body;

    let item = await show_intro(id);

    if(item == null)
    {
        ctx.body = {result: "fail"};
    }
    else
    {
        ctx.body = {result:"success", values : item}
    }
}

exports.update_intro = async (ctx, next) => {

    let {id, introduction} = ctx.request.body;

    let {affectedRows} = await update_intro(id, introduction);

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