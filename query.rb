# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

DB_ENV = { dbname: ENV['DB_NAME'], user: ENV['DB_USER'], password: ENV['DB_PASSWORD'] }.frozen

def select_all
  PG.connect(**DB_ENV) do |conn|
    conn.exec('SELECT * FROM memos')
  end
rescue PG::Error => e
  puts e
end

def select(params)
  sql = 'SELECT * FROM memos WHERE id = $1;'
  bind_values = [params['id']]
  begin
    PG.connect(**DB_ENV) do |conn|
      conn.exec_params(sql, bind_values)
    end
  rescue PG::Error => e
    puts e.message
  end
end

def store(params)
  sql = 'INSERT INTO memos (title, content) bind_values ($1, $2)'
  bind_values = [params['title'], params['content']]
  begin
    PG.connect(**DB_ENV) do |conn|
      conn.exec_params(sql, bind_values)
    end
  rescue PG::Error => e
    puts e.massage
  end
end

def update(params)
  sql = 'UPDATE memos SET title=$1, content=$2 WHERE id = $3'
  bind_values = [params['title'], params['content'], params['id']]
  begin
    PG.connect(**DB_ENV) do |conn|
      conn.exec_params(sql, bind_values)
    end
  rescue PG::Error => e
    puts e.message
  end
end

def destroy(params)
  sql = 'DELETE FROM memos WHERE id = $1'
  bind_values = [params['id']]
  begin
    PG.connect(**DB_ENV) do |conn|
      conn.exec_params(sql, bind_values)
    end
  rescue PG::Error => e
    puts e.message
  end
end
