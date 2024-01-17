var express = require('express');
var router = express.Router();
var userController = require('../controllers/user');
var authController = require('../controllers/auth');
var clueController = require('../controllers/clue');


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

router.get('/login', authController.renderLogin);
router.get('/logout', authController.logout);

router.get('/admin/user', userController.showAll);

router.get('/admin/user/create', userController.renderCreate);

router.get('/admin/user/:id/edit', userController.renderEdit);

router.get('/admin/clue', clueController.showAll);

router.get('/admin/clue/:id', clueController.renderLog);

module.exports = router;
