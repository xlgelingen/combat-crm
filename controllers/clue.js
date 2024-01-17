const ClueModel = require('../models/clue');
const Clue = new ClueModel();
const moment = require('moment');

const clue = {
    showAll: async function (req, res, next) {
        if(!res.locals.isLogin){
            res.redirect('/login');
            return;
        }
        const clues = await Clue.all();
        try {
            res.locals.clues = clues.map((data) => {
                switch (data.status) {
                    case 1:
                        data.statusName = '没有意向';
                        break;
                    case 2:
                        data.statusName = '意向一般';
                        break;
                    case 3:
                        data.statusName = '意向强烈';
                        break;
                    case 4:
                        data.statusName = '完成销售';
                        break;
                    case 5:
                        data.statusName = '取消销售';
                        break;
                }
                data.create_time = moment(data.create_time).format('YYYY-MM-DD HH:mm:ss')
                return data;
            });

            res.render('admin/clue', res.locals);
        } catch (e) {
            res.locals.error = e;
            res.render('error.tpl', res.locals);
        }
    },

    renderLog: async function (req, res, next) {
        if(!res.locals.isLogin){
            res.redirect('/login');
            return;
        }
        try {
            var id = req.params.id;
            const clue = await Clue.select({id});
            clue[0].create_time = moment(clue[0].create_time).format('YYYY-MM-DD HH:mm:ss')
            res.locals.clue = clue[0];
            res.render('admin/clue_log', res.locals);
        } catch (e) {
            res.locals.error = e;
            res.render('error.tpl', res.locals);
        }

    },

    insert: async function (req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let utm = req.body.utm;
        if (!name || !phone || !utm) {
            res.json({ code: 0, data: 'params empty!' });
            return
        }
        try {
            const clue = await Clue.insert({ name, phone, utm });
            res.json({ code: 200, data: clue });
        } catch (e) {
            res.json({ code: 0, data: e });
        }
    },

}

module.exports = clue;