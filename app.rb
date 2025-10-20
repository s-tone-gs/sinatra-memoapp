# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'erb'

DATA_PATH = 'data/memo.json'

get '/' do
  redirect '/articles'
end

get '/articles' do
  File.write(DATA_PATH, {}) unless File.exist?(DATA_PATH)
  @memos = JSON.load_file(DATA_PATH)
  erb :index
end

get '/articles/create' do
  erb :create
end

get '/articles/:id/edit' do
  @id = params['id']
  @memo = JSON.load_file(DATA_PATH)[@id]
  erb :edit
end

get '/articles/:id' do
  @id = params['id']
  @memo = JSON.load_file(DATA_PATH)[@id]
  erb :show
end

post '/articles' do
  memos = JSON.load_file(DATA_PATH)
  # 連番を生成
  new_id = memos.keys.max.to_i + 1
  memos[new_id] = params
  File.write(DATA_PATH, JSON.pretty_generate(memos))
  redirect '/articles'
end

delete '/articles/:id' do
  id = params['id']
  memos = JSON.load_file(DATA_PATH)
  memos.delete(id)
  File.write(DATA_PATH, JSON.pretty_generate(memos))
  redirect '/articles'
end

patch '/articles/:id' do
  id = params['id']
  memos = JSON.load_file(DATA_PATH)
  memos[id] = params
  File.write(DATA_PATH, JSON.pretty_generate(memos))
  redirect '/articles'
end
