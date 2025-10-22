# frozen_string_literal: true

require 'pg'
require 'dotenv/load'
require_relative 'query'

CONNECTION.exec(<<~SQL)
  CREATE TABLE memos (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT
  )
SQL
