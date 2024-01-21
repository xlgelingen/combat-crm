const RoleModel = require('../models/roles.js');
const Role = new RoleModel();
const userRoleModel = require('../models/user_role.js');
const userRole = new userRoleModel();
const rolePermissionModel = require('../models/role_permission.js');
const rolePermission = new rolePermissionModel();

const urp = {
    getRPData: async function (user_id) {
      const role = await userRole.select({user_id: user_id});
      // console.log('role-user:',role)
      var roleID = role[0].role_id;
      // console.log('roleid:',roleID)
      const permissions = await rolePermission.select({ role_id: roleID });
      var permissionsID = permissions.map(data => data.permission_id);

      return {
        role_id: roleID,
        permissions_id: permissionsID
      }
    },

    getPData: async function (role_id) {
      var roleID = role_id;
      const permissions = await rolePermission.select({ role_id: roleID });
      var permissionsID = permissions.map(data => data.permission_id);
      return {
        permissions_id: permissionsID
      }
    },
  }
  
  module.exports = urp;