class HangmanController < ApplicationController

  get '/' do
    erb :'hangman/index'
  end

  ##grabbing random words##
  get '/words' do
    content_type :json

    words = Word.all
    mystery_word = words.sample[:body]

    mystery_word.to_json
  end

end
