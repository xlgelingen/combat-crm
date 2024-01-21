var express = require('express');
var router = express.Router();
var userController = require('../controllers/user');
var loginController = require('../controllers/login');
var clueController = require('../controllers/clue');
var clueLogController = require('../controllers/clue_log');
var roleController = require('../controllers/role');


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.post('/user/create', userController.insert);
router.put('/user/edit', userController.update);
router.post('/login', loginController.login);

router.post('/role/create', roleController.insert);
router.put('/role/edit', roleController.update);
router.delete('/role/del', roleController.delete);


router.post("/clue", clueController.insert);

router.put("/clue_log", clueController.update);
router.post("/clue_log", clueLogController.insert);




module.exports = router;
