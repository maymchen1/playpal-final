class CreateDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :descriptions do |t|
      t.string :genre
      t.integer :player_limit
      t.string :description_title
      t.text :description_text

      t.timestamps
    end
  end
end
