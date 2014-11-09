class UsersController < ApplicationController

  get '/new' do
    erb :'users/new'
  end

  post '/' do
    @user = User.new(params[:user])
    @user.password = params[:password]

    if @user.valid?
      @user.save!
      redirect '/sessions/new'
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  end


  get '/profile' do
    current_user
    @games = current_user.hangman_games
    erb :'users/profile'
  end

  get '/profile/:id/edit'
    current_user = User.find(id: current_user.id)

    erb :'/users/edit'
  end

  patch '/' do
  end

end
