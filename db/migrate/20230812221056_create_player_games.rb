class CreatePlayerGames < ActiveRecord::Migration[7.0]
  def change
    create_table :player_games do |t|
      t.belongs_to :player_profile_id, null: false, foreign_key: true
      t.belongs_to :game_posting_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
