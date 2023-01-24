const Router = require('@koa/router');
const router = new Router();
const { myLogging} = require('./middleware/logging');
const webController = require('./web/controller')
const apiUserController = require('./api/user/controller');
const apifriendController = require('./api/friend/controller');
const apirequestController = require('./api/request/controller');
const apitagController = require('./api/tag/controller');
const apiFeedController = require('./api/feed/controller');
const {verify} = require('./middleware/auth');
const multer = require('@koa/multer');
const path = require('path');
const upload = multer({
    dest: path.resolve(__dirname, '../', 'storage')
})


router.use(myLogging);
router.get('/', webController.home);
router.get('/page/:page', webController.page);


/**
 * member, friends, friend_request
 */
router.get('/api/user/:id', apiUserController.info);
router.post('/api/user/register', apiUserController.register);
router.post('/api/user/login', apiUserController.login);
router.delete('/api/user/delete/:id', apiUserController.del);

router.get('/api/friend/show/:id', apifriendController.show)
router.post('/api/friend/insert', apifriendController.insert);
router.post('/api/friend/del', apifriendController.del);

router.get('/api/request/show/received/:id', apirequestController.show_request_received);
router.get('/api/request/show/sent/:id', apirequestController.show_request_sent);
router.post('/api/request/insert', apirequestController.insert);
router.post('/api/request/del', apirequestController.del);

router.get('/api/tag/show/:id', apitagController.show);
router.get('/api/tag/show/count/:id', apitagController.show_count);
router.post('/api/tag/check', apitagController.check);
router.post('/api/tag/insert', apitagController.insert);

router.post('/file/upload', upload.single('file'), require('./api/file/controller').upload);
router.get('/file/:id', require('./api/file/controller').download);


//router.use(verify);
router.get('/api/feed', apiFeedController.index);
router.post('/api/feed', apiFeedController.store);
router.get('/api/feed/:id', apiFeedController.show);
router.put('/api/feed/:id', apiFeedController.update);
router.delete('/api/feed/:id', apiFeedController.delete);

module.exports = router;
