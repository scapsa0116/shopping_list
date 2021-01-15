# frozen_string_literal: true

# userscontroller
class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect '/items' 
     else
    erb :'/users/new.html'
     end 
end 

  post '/signup' do 
    user = User.create(params)
    session[:id] = user.id
  if user.save
    redirect '/items'
  else
    redirect '/signup'
   end
  end 

  get '/login' do
    if logged_in?
      redirect '/items'
     else 
    erb :'users/login.html'
  end
end 

  post '/login' do
  user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:id] = user.id
    redirect  '/items'
  else
    redirect '/signup'
  end
    #redirect '/users/:id'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show.html'
  end


  post '/users' do
    @item = Item.new(product: params[:item])
    User.find(params[:id]).items << @item
    redirect "/users/#{params[:id]}"
  end

  get '/logout' do
   
      logout!
    
    # erb :'/users/logout.html'
    redirect '/'
  end
end 
  

  