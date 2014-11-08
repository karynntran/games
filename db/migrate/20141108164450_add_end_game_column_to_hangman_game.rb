class AddEndGameColumnToHangmanGame < ActiveRecord::Migration
  def change
    add_column :hangman_games, :end_game, :boolean, default: false
  end
end
