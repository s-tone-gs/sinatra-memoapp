# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

CONNECTION = PG.connect(
  dbname: ENV['DB_NAME'],
  user: ENV['DB_USER'],
  password: ENV['DB_PASSWORD']
)

def select_all
  CONNECTION.exec(<<~SQL)
    SELECT *
    FROM memos
    ORDER BY id ASC;
  SQL
end

def select(params)
  sql = <<~SQL
    SELECT *
    FROM memos
    WHERE id = $1;
  SQL
  bind_values = params.values_at('id')
  CONNECTION.exec_params(sql, bind_values)
end

def store(params)
  sql = <<~SQL
    INSERT INTO memos
      (title, content)
    VALUES ($1, $2);
  SQL
  bind_values = params.values_at('title', 'content')
  CONNECTION.exec_params(sql, bind_values)
end

def update(params)
  sql = <<~SQL
    UPDATE memos
    SET title = $1, content = $2
    WHERE id = $3;
  SQL
  bind_values = params.values_at('title', 'content', 'id')
  CONNECTION.exec_params(sql, bind_values)
end

def destroy(params)
  sql = <<~SQL
    DELETE FROM memos
    WHERE id = $1;
  SQL
  bind_values = params.values_at('id')
  CONNECTION.exec_params(sql, bind_values)
end
