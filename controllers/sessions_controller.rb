class SessionsController < ApplicationController

  get '/new' do
    erb :'sessions/new'
  end

  post '/' do
    redirect '/sessions/new' unless user = User.find_by({username: params[:username]})
    if user.password == params[:password]
      session[:current_user] = user.id
      redirect '/games'
    else
      redirect '/users/new'
    end
  end

  delete '/' do
    authenticate!
    session[:current_user] = nil
    redirect '/'
  end

end
