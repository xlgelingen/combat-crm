const ClueLogModel = require('../models/clue_log');
const ClueLog = new ClueLogModel();
const ClueModel = require('../models/clue');
const Clue = new ClueModel();
const moment = require('moment');

const clueLog = {
    showAll: async function (req, res, next) {
        try {
            const id = req.params.id;

            const clue = await Clue.select({id});
            clue[0].create_time = moment(clue[0].create_time).format('YYYY-MM-DD HH:mm:ss');
            res.locals.clue = clue[0];

            var clueLogs = await ClueLog.select({cule_id:id});
            res.locals.clueLogs = clueLogs.map(data=>{
                data.create_time = moment(data.create_time).format('YYYY-MM-DD HH:mm:ss');
                return data;
            });

            res.render('admin/clue_log', res.locals);
        } catch (e) {
            res.locals.error = e;
            res.render('error.tpl', res.locals);
        }
    },

    insert: async function (req, res, next) {
        let cule_id = req.body.cule_id;
        let content = req.body.content;
        if (!content || !cule_id) {
            res.json({ code: 0, data: 'params empty!' });
            return
        }
        try {
            const clueLog = await ClueLog.insert({ cule_id, content });
            res.json({ code: 200, data: clueLog });
        } catch (e) {
            res.json({ code: 0, data: e });
        }
    },

}

module.exports = clueLog;