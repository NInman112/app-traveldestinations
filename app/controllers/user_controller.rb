class UserController < ApplicationController

  get '/users' do
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params[:user])
    binding.pry
  end
end
