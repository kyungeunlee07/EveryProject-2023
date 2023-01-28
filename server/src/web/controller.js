exports.home = (ctx, next) => {
    ctx.body = "Hello World";
}

exports.page = async (ctx, next) =>{
    let page = ctx.params.page;
    let pagename;
    switch(page)
    {
        case 'terms':
            pagename = "이용약관";
            break;
        case 'policy':
            pagename = "개인정보 처리방침";
            break;
        default:
            pagename="오류";
            break;
    
            
    }

    await ctx.render('index', {pagename : pagename});
}

