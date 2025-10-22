# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'erb'
require_relative 'query'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @memos = select_all
  erb :index
end

get '/articles/create' do
  erb :create
end

get '/articles/:id/edit' do
  @memo = select(params).first
  erb :edit
end

get '/articles/:id' do
  @memo = select(params).first
  erb :show
end

post '/articles' do
  store(params)
  redirect '/articles'
end

delete '/articles/:id' do
  destroy(params)
  redirect '/articles'
end

patch '/articles/:id' do
  update(params)
  redirect '/articles'
end
