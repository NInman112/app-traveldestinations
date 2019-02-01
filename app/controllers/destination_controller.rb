class DestinationController < ApplicationController

  get '/destinations' do
    erb :'destinations/index'
  end

  get '/destinations/new' do
    erb :'destinations/new'
  end
end
