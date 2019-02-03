class DestinationController < ApplicationController

  get '/destinations' do
    erb :'destinations/index'
  end

  get '/destinations/new' do
    erb :'destinations/new'
  end

  post '/destinations/new' do
    @destination = Destination.new(:dest_name => params[:destination], :dest_description => params[:dest_desc])
    if @destination.dest_name.nil? || @destination.dest_description.nil?
      erb :error
    elsif Destination.exists?(dest_name: @destination.dest_name)
      erb :errordup
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
