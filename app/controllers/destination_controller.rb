class DestinationController < ApplicationController

  get '/destinations' do
    erb :'destinations/index'
  end

  get '/destinations/new' do
    erb :'destinations/new'
  end

  post '/destinations/new' do
    @destination = Destination.new(:dest_name => params[:dest][:destination], :dest_description => params[:dest][:dest_desc], :user_id => session[:user_id])
    @destination.user = @user = User.find(session[:user_id]) #dont think this is needed..

    if @destination.dest_name == "" || @destination.dest_description == ""
      erb :'/destinations/error'
    else
      @destination.save
      redirect '/destinations'
    end
  end

  get '/destinations/:id/edit' do
    @destination = Destination.find(params[:id])
    erb :'destinations/edit'
  end

  patch '/destinations/:id' do
    @destination = Destination.find(params[:id])
    @destination.update(:dest_name => params[:destination], :dest_description => params[:dest_desc])
    redirect '/destinations'
  end

  delete '/destinations/:id' do
    @destinations = Destination.find(params[:id])
    @destinations.destroy
    redirect '/destinations'
  end
end
