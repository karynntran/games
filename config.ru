require 'bundler'
Bundler.require
Dotenv.load

require './helpers/authentication_helper'

require './models/hangman_game'
require './models/tictactoe_game'
require './models/user'
require './models/word'

require './controllers/application_controller'
require './controllers/hangman_controller'
require './controllers/sessions_controller'
require './controllers/tic_tac_toe_controller'
require './controllers/users_controller'


map('/tic_tac_toe'){ run TicTacToeController }

map('/hangman'){ run HangmanController }

map('/users'){ run UsersController }

map('/sessions'){ run SessionsController }

map('/'){ run ApplicationController }
