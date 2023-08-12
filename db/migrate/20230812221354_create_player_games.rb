class CreatePlayerGames < ActiveRecord::Migration[7.0]
  def change
    create_table :player_games do |t|
      t.belongs_to :player_profile, null: false, foreign_key: true
      t.belongs_to :game_posting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
