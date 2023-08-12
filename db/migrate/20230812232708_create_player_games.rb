class CreatePlayerGames < ActiveRecord::Migration[7.0]
  def change
    create_table :player_games do |t|
      t.references :player_profile, foreign_key: true
      t.references :game_posting, foreign_key: true

      t.timestamps
    end
  end
end
