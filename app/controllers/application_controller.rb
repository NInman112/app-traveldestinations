require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "secret"
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
	   enable :sessions
	end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

end
