const UserModel = require('../models/users');
const User = new UserModel();
var jwt = require("jsonwebtoken");
const JWT_SECRET = process.env.JWT_SECRET;

const auth = {
    login: async function (req, res, next) {
        let phone = req.body.phone;
        let password = req.body.password;

        if (!phone || !password) {
            res.json({ code: 0, data: 'params empty!' })
            return
        }

        try {
            let userArr = await User.select({ phone, password })
            let user = userArr[0];
            if (user) {
                var token = jwt.sign({ user_id: user.id, user_name: user.name, user_phone: user.phone, user_password: user.password }, JWT_SECRET, { expiresIn: "30d" });
                res.cookie('web_token', token, { maxAge: 60 * 24 * 60 * 60 });
                res.json({ code: 200, data: token })
            } else {
                res.json({ code: 0, data: { msg: '没有此用户' } })
            }
        } catch (e) {
            res.json({ code: 0, data: e })
        }
    },

    renderLogin: async function (req, res, next) {
        if (res.locals.isLogin) {
            res.redirect('/admin/user');
            return;
        }
        res.render('login.tpl', res.locals)
    },

    logout: function (req, res, next) {
        res.clearCookie('web_token');
        res.redirect('/login'); 
    }
}

module.exports = auth;