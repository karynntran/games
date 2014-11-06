class CreateHangmanGames < ActiveRecord::Migration
  def change
    create_table :hangman_games do |t|
      t.references :user
      t.string :word
      t.string :game_state
      t.integer :bad_guesses
      t.timestamps
    end
  end
end