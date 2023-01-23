
/** 새 댓글 작성 처리 */
exports.store = (ctx, next) => {
    ctx.body = `댓글 작성 완료`;
}
/** 댓글 상세 보기 */
exports.show('/comment/:id', (ctx, next) => {
    let id = ctx.params.id;
    ctx.body = `${id} 댓글`;
});

/**댓글 수정 */
exports.update = (ctx, next) => {
    let id = ctx.params.id;
    ctx.body = `${id} 댓글 수정`;
};

/**댓글 삭제 */
exports.delete = (ctx, next) => {
    let id = ctx.params.id;
    ctx.body = `${id} 댓글 삭제`;
}