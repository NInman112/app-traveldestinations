class UserController < ApplicationController

  get '/users' do
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if params[:username].empty? || params[:password].empty? || params[:first_name].empty? || params[:last_name].empty? || params[:age].empty?
      redirect :"/users/new"
    else
      @user = User.create(params)
    end
  end

end
