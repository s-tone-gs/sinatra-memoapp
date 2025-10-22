# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

PG.connect(dbname: ENV['DB_NAME'], user: ENV['DB_USER'], password: ENV['DB_PASSWORD']) do |conn|
  conn.exec(<<~SQL)
    CREATE TABLE memos (
      id SERIAL PRIMARY KEY,
      title VARCHAR(50) NOT NULL,
      content TEXT
    )
  SQL
end
