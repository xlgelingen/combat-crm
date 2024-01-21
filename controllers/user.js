const moment = require('moment');
const UserModel = require('../models/users');
const User = new UserModel();
const userRoleModel = require('./../models/user_role.js');
const userRole = new userRoleModel();
const urp = require('../middleware/user_role_permission');
var jwt = require("jsonwebtoken");
const JWT_SECRET = process.env.JWT_SECRET;


const user = {
    showAll: async function (req, res, next) {
        var index = req.query.page_index;
        var size = req.query.page_size;
        var drift = (index - 1) * size;
        console.log(index, size, drift);

        res.locals.pageInfo = {};
        res.locals.pageInfo.index = index;
        res.locals.pageInfo.size = size;
        const users = await User.pagination(drift, size);
        try {
            res.locals.users = users.map((data) => {
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
        try {
            var id = req.params.id;
            const user = await User.select({ id });
            res.locals.user = user[0];
            res.render('admin/user_edit', res.locals);
        } catch (e) {
            res.locals.error = e;
            res.render('error.tpl', res.locals);
        }

    },

    renderCreate: function (req, res, next) {
        res.render('admin/user_create', res.locals);
    },

    insert: async function (req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let password = req.body.password;
        let role = req.body.role;
        if (!name || !phone || !password || !role) {
            res.json({ code: 0, data: 'params empty!' });
            return
        }
        try {
            const user = await User.insert({ name, phone, password });
            const userId = user[0];
            await userRole.insert({
                user_id: userId,
                role_id: role
            })
            res.json({ code: 200, data: { id: userId }, message: '创建成功' })
        } catch (e) {
            res.json({ code: 0, data: e });
        }
    },

    update: async function (req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let password = req.body.password;
        let roleID = req.body.role;
        let id = req.body.id;
        if (!name || !phone || !password || !roleID || !id) {
            res.json({ code: 0, data: 'params empty!' });
            return
        }
        try {
            await User.update(id, { name, phone, password});
            await userRole.where({'user_id':id}).update({'role_id':roleID})
            if(res.locals.userInfo.id==id){
                var rpData = await urp.getRPData(id);
                var permissionsID = rpData.permissions_id;
                var token = jwt.sign({ user_id: id, user_name: name, user_phone: phone, user_password: password, user_role: roleID, user_permissions: permissionsID}, JWT_SECRET, { expiresIn: "30d" });
                res.cookie('web_token', token, { maxAge: 60 * 24 * 60 * 60 });
            }
            res.json({ code: 200, data: {message: '编辑成功'} });
        } catch (e) {
            console.log(e.message)
            res.json({ code: 0, data: e.message || e.errors });
        }
    },
}

module.exports = user;