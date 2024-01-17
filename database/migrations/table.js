exports.up = function(knex) {
    return knex.schema
      .createTable('users', function (table) {
        table.increments('id');
        table.string('name', 255);
        table.string('phone', 255);
        table.string('password', 255);
        table.integer('role', 11);
        table.timestamp('create_time').defaultTo(knex.fn.now());
      })
      .createTable('clue', function (table) {
        table.increments('id');
        table.string('name', 255);
        table.string('phone', 255);
        table.string('utm', 255);
        table.timestamp('create_time').defaultTo(knex.fn.now());
        table.string('sale_name', 255);
        table.integer('status', 11);
        table.string('remark', 255);
      })
      .createTable('clue_log', function (table) {
        table.integer('id', 11);
        table.integer('clue_id', 11);
        table.timestamp('create_time').defaultTo(knex.fn.now());
        table.string('content', 255);
      })
  };
  
  exports.down = function(knex) {
    return knex.schema
      .dropTable("userss")
      .dropTable("clues")
      .dropTable("clue_logs")
  };
  
  exports.config = { transaction: false };