require 'bundler'
Bundler.require
Dotenv.load

Dir.glob("./{helpers,controllers,models}/*.rb").each do |file|
  require file
  puts "required #{file}"
end

require './helpers/authentication_helper.rb'
require './models/hangman_game.rb'
require './models/tictactoe_game.rb'
require './models/user.rb'
require './models/word.rb'
require './controllers/application_controller.rb'
require './controllers/hangman_controller.rb'
require './controllers/sessions_controller.rb'
require './controllers/tic_tac_toe_controller.rb'
require './controllers/users_controller.rb'


map('/tic_tac_toe'){ run TicTacToeController }

map('/hangman'){ run HangmanController }

map('/users'){ run UsersController }

map('/sessions'){ run SessionsController }

map('/'){ run ApplicationController }
