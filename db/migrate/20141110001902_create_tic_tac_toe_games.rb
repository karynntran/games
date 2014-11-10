class CreateTicTacToeGames < ActiveRecord::Migration
  def change
    create_table :tic_tac_toe_games do |t|
      t.references :user
      t.string :x_moves
      t.string :o_moves
      t.string :game_state
      t.boolean :end_game
      t.timestamps
    end
  end
end
