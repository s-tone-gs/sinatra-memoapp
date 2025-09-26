# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'erb'

DATA_STORE_PATH = 'data/memo.json'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @memos = JSON.load_file(DATA_STORE_PATH)
  erb :index
end

get '/articles/create' do
  erb :create
end

get '/articles/:id/edit' do
  @id = params['id'].to_i
  @memo = JSON.load_file(DATA_STORE_PATH)[@id]
  erb :edit
end

get '/articles/:id' do
  @id = params['id'].to_i
  @memo = JSON.load_file(DATA_STORE_PATH)[@id]
  erb :show
end

post '/articles' do
  memos = JSON.load_file(DATA_STORE_PATH)
  memos.push(sanitize_content(params))
  File.write(DATA_STORE_PATH, JSON.pretty_generate(memos))
  redirect '/articles'
end

delete '/articles/:id' do
  id = params['id'].to_i
  memos = JSON.load_file(DATA_STORE_PATH)
  memos.delete_at(id)
  File.write(DATA_STORE_PATH, JSON.pretty_generate(memos))
  redirect '/articles'
end

patch '/articles/:id' do
  id = params['id'].to_i
  memos = JSON.load_file(DATA_STORE_PATH)
  memos[id] = sanitize_content(params)
  File.write(DATA_STORE_PATH, JSON.pretty_generate(memos))
  redirect '/articles'
end

def sanitize_content(params)
  params.transform_values { |v| ERB::Util.html_escape(v) }
end
