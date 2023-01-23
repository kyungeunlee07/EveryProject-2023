const Router = require('@koa/router');
const router = new Router();
const { myLogging} = require('./middleware/logging');
const webController = require('./web/controller')
const apiUserController = require('./api/user/controller');
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

router.post('/file/upload', upload.single('file'), require('./api/file/controller').upload);
router.get('/file/:id', require('./api/file/controller').download);


//router.use(verify);
router.get('/api/feed', apiFeedController.index);
router.post('/api/feed', apiFeedController.store);
router.get('/api/feed/:id', apiFeedController.show);
router.put('/api/feed/:id', apiFeedController.update);
router.delete('/api/feed/:id', apiFeedController.delete);

module.exports = router;
