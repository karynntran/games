class HangmanController < ApplicationController

  get '/' do
    erb :'hangman/index'
  end

  ##grabbing random words##
  get '/words' do
    content_type :json

    words = Word.all
    one_word = words.sample[:body]
    one_word.to_json
  end

end
