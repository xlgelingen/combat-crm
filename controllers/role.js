const moment = require('moment');
const RoleModel = require('./../models/roles.js');
const Role = new RoleModel();
const userRoleModel = require('./../models/user_role.js');
const userRole = new userRoleModel();
const rolePermissionModel = require('./../models/role_permission.js');
const rolePermission = new rolePermissionModel();
const urp = require('../middleware/user_role_permission.js')
const PermissionModel = require('./../models/permissions.js');
const Permission = new PermissionModel();


const rolelController = {
  index: async function (req, res, next) {
    try {
      const roles = await Role.all();
      res.locals.roles = roles.map((data) => {
        data.create_time = moment(data.create_time).format('YYYY-MM-DD HH:mm:ss')
        return data;
      });
      res.render('admin/role.tpl', res.locals)
    } catch (e) {
      res.json({ code: 0, message: e.message })
    }
  },

  show: async function (req, res, next) {
    const id = req.params.id;
    try {
      const role = await Role.first({ id });
      if (!role) {
        res.json({ code: 0, message: '不存在' });
        return;
      }
      const permissions = await rolePermission.where({ role_id: id });
      permissionsTransform = permissions.map(data => data.permission_id);
      res.json({
        code: 200, data: {
          id: id,
          name: role.name,
          permissions: permissionsTransform
        }
      })
    } catch (e) {
      res.json({ code: 0, message: e.message })
    }
  },

  renderEdit: async function (req, res, next) {
    try {
      var id = req.params.id;
      const role = await Role.select({ id });
      res.locals.role = role[0];
      var pData = await urp.getPData(id);
      res.locals.role.permissions = pData.permissions_id;
      res.locals.permissions = await Permission.all();
      res.render('admin/role_edit', res.locals);
    } catch (e) {
      res.locals.error = e;
      res.render('error.tpl', res.locals);
    }

  },

  renderCreate: async function (req, res, next) {
    res.locals.permissions = await Permission.all();
    res.render('admin/role_create', res.locals);
  },

  insert: async function (req, res, next) {
    const name = req.body.name;
    const slug = req.body.slug;
    const describe = req.body.describe;
    const permissions = JSON.parse(req.body.permissions);
    // console.log(name, slug, describe, permissions)
    if (!name || !slug || !describe || !permissions) {
      res.json({ code: 0, data: 'params empty!' });
      return
    }
    try {
      const ids = await Role.insert({ name: name, slug: slug, describe: describe });
      const roleId = ids[0];
      await rolePermission.insert(permissions.map(item => {
        return {
          permission_id: item,
          role_id: roleId
        }
      }))
      res.json({ code: 200, data: { id: roleId }, message: '创建成功' })
    } catch (e) {
      res.json({ code: 0, message: e.message || e.errors })
    }
  },

  update: async function (req, res, next) {
    const id = req.body.id;
    const name = req.body.name;
    const slug = req.body.slug;
    const describe = req.body.describe;
    const permissions = JSON.parse(req.body.permissions);
    if (!id || !name || !slug || !describe || !permissions) {
      res.json({ code: 0, data: 'params empty!' });
      return
    }
    try {
      // 修改角色信息
      await Role.update(id, { name: name, slug: slug, describe: describe });
      // 修改角色关联的权限信息
      const originPermissions = await rolePermission.where({ role_id: id })
      const originIds = originPermissions.map(data => data.permission_id)
      // console.log('originIds: ',originIds)
      // console.log('permissions: ',permissions)
      
      const removeIds = originIds.filter(data => !permissions.includes(data))
      // console.log('removeIds: ',removeIds)
      const insertIds = permissions.filter(data => !originIds.includes(data))
      // console.log('insertIds: ',insertIds)

      if (removeIds.length) {
        await rolePermission.delPermission(removeIds.map(data => {
          return {
            permission_id: data,
            role_id: id
          }
        }))
      }
      if (insertIds.length) {
        await rolePermission.insert(insertIds.map(data => {
          return {
            permission_id: data,
            role_id: id
          }
        }))
      }
      res.json({ code: 200, message: '编辑成功' })
    } catch (e) {
      console.log(e.message)
      res.json({ code: 0, message: e.message || e.errors })
    }
  },

  delete: async function (req, res, next) {
    try {
      const id = req.body.id;
      await userRole.delete({ role_id: id });
      await rolePermission.delete({ role_id: id });
      await Role.delete({ id });
      res.json({ code: 200, message: '删除成功' })
    } catch (e) {
      console.log(e.message)
      res.json({ code: 0, message: e.message })
    }
  },
}

module.exports = rolelController;