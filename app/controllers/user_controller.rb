class UserController < ApplicationController

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(:username => params[:username], :password => params[:password]) 
    if @user.username == "" || @user.password_digest.nil?
      erb :'/users/error'
    elsif User.exists?(username: @user.username)
      erb :'/users/errordup'
    else
      @user.save
      redirect '/users/login'
    end
  end

  get '/users' do
    @user = User.find(session[:user_id])
    erb :'users/show'
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users'
    else
      erb :'/users/error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
