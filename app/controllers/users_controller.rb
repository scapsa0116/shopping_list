# frozen_string_literal: true

# userscontroller
class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/new.html'
  end

  get '/login' do
    erb :'users/login.html'
  end

  post '/login' do
    redirect '/users/:id'
  end

  post '/logout' do
    redirect '/'
  end

  get '/users/:id' do
    erb :'/users/show.html'
  end

  post '/users/new' do
    redirect '/login'
  end
end