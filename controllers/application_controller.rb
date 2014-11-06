class ApplicationController < Sinatra::Base

  ##helpers##

  ##to enable##
  enable :sessions
  enable :method_override

  ##timeout issue resolver##
  register Sinatra::ActiveRecordExtension

  ##set files##
  set :database, {adapter: "postgresql", database: "games_db"}
  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public", __FILE__)


  get '/' do
    @current_user
    erb :index
  end

  get '/games' do
    @current_user
    erb :games_index
  end

end
