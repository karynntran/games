class HangmanController < ApplicationController

  get '/' do
    erb :'hangman/index'
  end

  ##grabbing random words using ajax##
  get '/words' do
    api_response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/sd2/xml/test?key=787fcbd7-52ea-4503-b1f9-cbda88058466")

    api_parse = Nokogiri::XML(api_response)
  end

end
