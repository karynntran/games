class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_hash, null: false
      t.string :wins
      t.string :losses
      t.text   :aboutme

      t.timestamps
    end
  end
end
