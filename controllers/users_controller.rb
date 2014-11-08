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

  get '/profile' do
    current_user

    @games = current_user.hangman_games

  end

  end

end
