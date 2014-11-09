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


  get '/profile/:id' do
    current_user = User.find(params[:id])
    @games = current_user.hangman_games
    erb :'users/profile'
  end

  get '/profile/:id/edit' do
    current_user = User.find(params[:id])

    erb :'/users/edit'
  end

  patch '/profile/:id' do
    current_user = User.find(params[:id])
    current_user.update(params[:user])
    redirect 'users/profile/#{current_user.id}'
  end

end
