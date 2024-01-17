const auth = {
  isLogin: function (req, res, next) {
    if (!res.locals.isLogin) {
      res.redirect('/login')
      return
    }
    next();
  },

  isKeeper: function (req, res, next) {
    if (!res.locals.userInfo || res.locals.userInfo.role != 1) {
      res.render('error', { status: 403, message: '403 Forbidden' })
      return
    }
    next();
  }
}

module.exports = auth;