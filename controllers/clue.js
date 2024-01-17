const ClueModel = require('../models/clue');
const Clue = new ClueModel();
const moment = require('moment');

const clue = {
    showAll: async function (req, res, next) {
        var sale_name = res.locals.userInfo.name;
        var role = res.locals.userInfo.role;
        var clues = null;
        if(role == 1){
            clues = await Clue.all();
        }else if(role == 2){
            clues = await Clue.select({sale_name});
        }
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

    update: async function (req, res, next) {
        let sale_name = req.body.sale_name;
        let status = req.body.status;
        let remark = req.body.remark;
        let id = req.body.id;
        if(!sale_name || !status || !remark || !id){
            res.json({ code: 0, data: 'params empty!' });
            return
          }
        try {
            const log = await Clue.update(id, {sale_name, status, remark});
            res.json({code:200, data:log});
        } catch (e) {
            res.json({code:0, data:e});
        }
    },

}

module.exports = clue;