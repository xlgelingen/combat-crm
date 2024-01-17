var express = require('express');
var router = express.Router();
var userController = require('../controllers/user');
var authController = require('../controllers/auth');
var clueController = require('../controllers/clue');




/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.post('/user/create', userController.insert);
router.put('/user/edit', userController.update);
router.post('/login', authController.login);

router.post("/clue", clueController.insert)


module.exports = router;
