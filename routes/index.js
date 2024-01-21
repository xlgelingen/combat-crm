var express = require('express');
var router = express.Router();
var userController = require('../controllers/user');
var loginController = require('../controllers/login');
var clueController = require('../controllers/clue');
var clueLogController = require('../controllers/clue_log');
var authMiddleWare = require('../middleware/auth');
var roleController = require('../controllers/role');




/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

router.get('/login', loginController.renderLogin);
router.get('/logout', loginController.logout);

router.get('/admin/user', authMiddleWare.isLogin, authMiddleWare.isKeeper, userController.showAll);
router.get('/admin/user/create', authMiddleWare.isLogin, authMiddleWare.isKeeper, userController.renderCreate);
router.get('/admin/user/:id/edit', authMiddleWare.isLogin, authMiddleWare.isKeeper, userController.renderEdit);

router.get('/admin/role', authMiddleWare.isLogin, authMiddleWare.isKeeper, roleController.index);
router.get('/admin/role/create', authMiddleWare.isLogin, authMiddleWare.isKeeper, roleController.renderCreate);
router.get('/admin/role/:id/edit', authMiddleWare.isLogin, authMiddleWare.isKeeper, roleController.renderEdit);

router.get('/admin/clue', authMiddleWare.isLogin, clueController.showAll);

router.get('/admin/clue/:id', authMiddleWare.isLogin, clueLogController.showAll);

module.exports = router;
