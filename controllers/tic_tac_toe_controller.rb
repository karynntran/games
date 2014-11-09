class TicTacToeController < ApplicationController

  get '/' do
    erb :'tictactoe/index'
  end

end
