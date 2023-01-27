const Router = require('@koa/router');
const router = new Router();
const { myLogging} = require('./middleware/logging');
const webController = require('./web/controller')
const apiUserController = require('./api/user/controller');
const apifriendController = require('./api/friend/controller');
const apirequestController = require('./api/request/controller');
const apitagController = require('./api/tag/controller');
const apiFeedController = require('./api/feed/controller');
const apicommentController = require('./api/comment/controller');
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
router.post('/api/user/register', apiUserController.register);
router.post('/api/user/login', apiUserController.login);
router.use(verify);
router.post('/api/user', apiUserController.info);
router.post('/api/user/delete', apiUserController.del);
router.post('/api/user/show_intro', apiUserController.show_intro);
router.post('/api/user/update_intro', apiUserController.update_intro);

router.post('/api/friend/show', apifriendController.show)
router.post('/api/friend/insert', apifriendController.insert);
router.post('/api/friend/del', apifriendController.del);

router.post('/api/request/show/received', apirequestController.show_request_received);
router.post('/api/request/show/sent', apirequestController.show_request_sent);
router.post('/api/request/insert', apirequestController.insert);
router.post('/api/request/del', apirequestController.del);

router.post('/api/tag/show', apitagController.show);
router.post('/api/tag/show/count', apitagController.show_count);
router.post('/api/tag/check', apitagController.check);
router.post('/api/tag/insert', apitagController.insert);

router.post('/file/upload', upload.single('file'), require('./api/file/controller').upload);
router.get('/file/:id', require('./api/file/controller').download);


router.get('/api/feed/index/:id', apiFeedController.index);
router.post('/api/feed', apiFeedController.store);
router.get('/api/feed/:id', apiFeedController.show);
router.put('/api/feed/:id', apiFeedController.update);
router.delete('/api/feed/:id', apiFeedController.delete);


/**
 * feed, comment
//  */
router.post('/api/comment', apicommentController.store);
router.put('/api/comment/:id', apicommentController.update);
router.delete('/api/comment/:id', apicommentController.delete);

module.exports = router;