# frozen_string_literal: true

require './config/environment'

# Manages non model hased routing, helpers, sessions
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end

  

    def logout!
      session.clear
    end
  end
end
