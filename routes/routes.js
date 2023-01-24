const Koa = require('koa');
const Router = require('@koa/router');
const app = new Koa();
const router = new Router();

//서버 실행 포트
const apiboardController = require('./controller/controller');

router.get('/page/:board',controller.board); 

router.get('/page/:board',boardcontroller.index);
router.post('/page/:board', boardcontroller.store);


module.exports = router;

