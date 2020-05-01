class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/new.html"
  end

  get "/login" do
    erb :"users/login.html"
  end

  post "/login" do
    redirect '/users/:id'
  end 
  
  post "/logout" do
    redirect '/'
  end

  #shows all items
  get "/users/:id" do
    erb :"/users/show.html"
  end

  post "/users/new" do
    #@user = User.create(username: params[:username], password params[:password], email: params[:email])
    redirect "/login"
  end
end

  
  

  
