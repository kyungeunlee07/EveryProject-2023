//전체 피드 리스트 
exports.index = async (ctx, next)=>{
    ctx.body = "학과별 게시판 리스트";

    let item = await index();

    if(item == null)
    {
        ctx.body = {result: "학과 가져오기 실패"};
    }
    else
    {
        ctx.body = {result: "success", items: item};
    }
}