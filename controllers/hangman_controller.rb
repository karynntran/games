class HangmanController < ApplicationController

  get '/' do
    current_user
    @letters = ('a'..'z').to_a

    erb :'hangman/index'
  end

  get '/start_game' do
    content_type :json
    current_user

    binding.pry
    user_id = current_user.id
    word = Word.all.sample[:body]
    game_state = word
    wrong_guesses = 0 #counter

    game = HangmanGame.create({
      user_id: user_id,
      word: word,
      game_state: word,
      wrong_guesses: wrong_guesses
    }).to_json
  end

  ##grabbing random words##
  get '/words' do
    content_type :json

    words = Word.all
    mystery_word = words.sample[:body]
    mystery_word.to_json
  end

  patch '/guess_answer' do
    #update game state?
  end

end
