class HangmanController < ApplicationController

  get '/' do
    @letters = ('a'..'z').to_a

    erb :'hangman/index'
  end

  get '/words' do
    content_type :json

    words = Word.all
    mystery_word = words.sample[:body]
    mystery_word.to_json
  end

  ##grabbing random words##
  get '/words' do
    content_type :json

    words = Word.all
    mystery_word = words.sample[:body]
    mystery_word.to_json
  end

  patch '/make_move' do
    #update game state?
  end

end
