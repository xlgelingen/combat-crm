const UserModel = require('../models/users');
const User = new UserModel();
const moment = require('moment');

const user = {
    showAll: async function (req, res, next) {
        if(!res.locals.isLogin){
            res.redirect('/login');
            return;
        }

        const users = await User.all();
        try {
            res.locals.users = users.map((data) => {
                switch (data.role) {
                    case 1:
                        data.roleName = '管理员';
                        break;
                    case 2:
                        data.roleName = '销售员';
                        break;
                }
                data.create_time = moment(data.create_time).format('YYYY-MM-DD HH:mm:ss')
                return data;
            });

            res.render('admin/user', res.locals);
        } catch (e) {
            res.locals.error = e;
            res.render('error.tpl', res.locals);
        }
    },

    renderEdit: async function (req, res, next) {
        if(!res.locals.isLogin){
            res.redirect('/login');
            return;
        }
        try {
            var id = req.params.id;
            const user = await User.select({id});
            res.locals.user = user[0];
            res.render('admin/user_edit', res.locals);
        } catch (e) {
            res.locals.error = e;
            res.render('error.tpl', res.locals);
        }

    },

    renderCreate: function (req, res, next) {
        if(!res.locals.isLogin){
            res.redirect('/login');
            return;
        }
        res.render('admin/user_create', res.locals);
    },

    insert: async function (req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let password = req.body.password;
        let role = req.body.role;
        if(!name || !phone || !password || !role){
            res.json({ code: 0, data: 'params empty!' });
            return
          }
        try {
            const user = await User.insert({name, phone, password, role});
            res.json({code:200, data:user});
        } catch (e) {
            res.json({code:0, data:e});
        }
    },

    update: async function (req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let password = req.body.password;
        let role = req.body.role;
        let id = req.body.id;
        if(!name || !phone || !password || !role || !id){
            res.json({ code: 0, data: 'params empty!' });
            return
          }
        try {
            const user = await User.update(id, {name, phone, password, role});
            res.json({code:200, data:user});
        } catch (e) {
            res.json({code:0, data:e});
        }
    },
}

module.exports = user;