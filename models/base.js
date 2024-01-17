const config = require('./../knexfile.js');
const knex = require('knex')(config);

class Base {
  constructor(props) {
    this.table = props;
  }

  all() {
    return knex(this.table).select()
  }

  select(params) {
    return knex(this.table).select().where(params)
  }

  pagination(drift, size) {
    return knex(this.table).select().limit(size).offset(drift)
  }

  insert(params) {
    return knex(this.table).insert(params)
  }

  update(id, params) {
    return knex(this.table).where('id', '=', id).update(params)
  }

  delete(id) {
    return knex(this.table).where('id', '=', id).del()
  }
}

module.exports = Base;