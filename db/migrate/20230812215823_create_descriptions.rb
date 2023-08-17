class CreateDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :descriptions do |t|
      t.string :genre
      t.integer :player_limit
      t.text :description_text
      t.string :description_title
      t.references :game_posting, foreign_key: true
      t.timestamps
    end
  end
end
