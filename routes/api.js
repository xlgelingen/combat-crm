var express = require('express');
var router = express.Router();
var userController = require('../controllers/user');
var authController = require('../controllers/auth');



/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.post('/user/create', userController.insert);
router.put('/user/edit', userController.update);
router.post('/login', authController.login);


module.exports = router;
