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
    if !logged_in?
      redirect '/login'
      end
    erb :'/items/new.html'
  end

  # POST: /items
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

  # GET: /items/5
  get '/items/:id' do
    if !logged_in?
      redirect '/login'
      end
      @item = Item.find_by_id(params[:id])
      erb :'/items/show.html'
  end

  # GET: /items/5/edit
  get '/items/:id/edit' do
    if !logged_in?
      redirect '/login'
      end
      @item = Item.find(params[:id])
      redirect '/items' if @item.user !=current_user
    erb :'/items/edit.html'
  end

  # PATCH: /items/5
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
      redirect "/items/#{params[:id]}"
      end 
  end 

  # DELETE: /items/5/delete
  delete '/items/:id' do
    @item = Item.find(params[:id])
    redirect '/' if @item.user !=current_user
    redirect "items/#{@item.id}/edit.html" if params [:item][:name].empty?
    @item.name = [:item][:name]
    @item.save
    redirect "/items/#{@item.id}"
  end
end
