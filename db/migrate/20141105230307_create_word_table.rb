class CreateWordTable < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :body
    end
  end
end
