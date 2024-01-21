const PermissionModel = require('./../models/permissions.js');
const Permission = new PermissionModel();

const permissionlController = {
  index: async function(req, res, next) {
    try {
      const permissions = await Permission.all()
      res.json({error_code: 0, data: { permissions} })
    } catch (e) {
      res.json({error_code: 1, message: e.message})
    }
  },
}

module.exports = permissionlController;