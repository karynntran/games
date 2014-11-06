class HangmanController < ApplicationController

  get '/' do
    erb :'hangman/index'
  end

  ##grabbing random words##
  get '/words' do
    words = Word.all
    one_word = words.sample[:body]
    one_word.to_json
  end

end
