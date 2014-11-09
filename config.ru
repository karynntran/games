require 'bundler'
Bundler.require
Dotenv.load

Dir.glob("./{helpers,controllers,models}/*.rb").each do |file|
  require file
  puts "required #{file}"
end

map('/tic_tac_toe'){ run TicTacToeController }

map('/hangman'){ run HangmanController }

map('/users'){ run UsersController }

map('/sessions'){ run SessionsController }

map('/'){ run ApplicationController }
