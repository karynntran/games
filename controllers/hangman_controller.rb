class HangmanController < ApplicationController

  get '/' do
    authenticate!
    current_user
    @letters = ('a'..'z').to_a

    erb :'hangman/index'
  end

  ### start game ###

  get '/start_game' do
    content_type :json
    current_user

    user_id = current_user.id
    word = Word.all.sample[:body]
    game_state = word

    hangman_data = {
      user_id: user_id,
      word: word,
    }

    game = HangmanGame.create(hangman_data)
    game.to_json
  end

### guesses ###

  patch '/word-guess' do
    game_id = params[:gameId]
    guessed_word = params[:guess]
    game = HangmanGame.find(game_id)
    game.guess_word(guessed_word)
    game.to_json
  end

  patch '/letter-guess' do
    game_id = params[:gameId]
    guessed_letter = params[:guess]
    game = HangmanGame.find(game_id)
    game.guess_letter(guessed_letter)
    game.to_json
  end


### snowman image ###
  get '/snowman' do
    game = current_user.hangman_games.last
    {image: game.snowman}.to_json
  end

### user output ###

#shows win or loss!
  get '/win-or-lose' do
    game = current_user.hangman_games.last
    {result: game.win_or_lose}.to_json
  end

end
