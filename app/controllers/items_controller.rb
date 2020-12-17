# frozen_string_literal: true

# itemscontroller
class ItemsController < ApplicationController
  
  get '/items' do 
    if !logged_in?
      redirect '/login'
      end
      @items = Item.all 
      erb :'/items/index.html' 
    end 

 get '/items/new' do
    redirect '/login' if !logged_in?
    erb :'/items/new.html'
  end

  get '/items/:id' do
    if !logged_in?
      redirect '/login'
    end
      @item = Item.find_by_id(params[:id])
      redirect '/items'
  end

  post '/items' do
    if !logged_in?
      redirect '/login'
      end
      @item = current_user.items.create(params)
      if @item.save
        redirect "/items/#{@item.id}"
      else
    redirect '/items/new.html'
  end
end

  get '/items/:id/edit' do
    if !logged_in?
      redirect '/login'
      end
      @item = Item.find(params[:id])
      redirect '/items' if @item.user !=current_user
    erb :'/items/edit.html'
  end

  patch '/items/:id' do
    if !logged_in?
      redirect '/login'
      end
      if params[:name] == "" 
        redirect "/items/#{params[:id]}/edit.html"
    # redirect '/items/:id'
  end
      @item = Item.find(params[:id])
      @item.name = params[:name]
      @item.save
      redirect "/items"
  end 
  

  get '/items/:id/delete' do
    if !logged_in?
      redirect '/login'
      end
      @item = Item.find(params[:id])
      redirect '/items' if @item.user !=current_user
    erb :'/items/show.html'
  end


  delete '/items/:id' do
    @item = Item.find(params[:id])
    redirect '/' if @item.user !=current_user
    #redirect "items/#{@item.id}/edit.html" if params [:item][:name].empty?
    @item.destroy
    redirect "/items"
  end
end
