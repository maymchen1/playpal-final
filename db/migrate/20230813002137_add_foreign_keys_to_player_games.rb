class AddForeignKeysToPlayerGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :player_games, :player_profile, foreign_key: true
    add_reference :player_games, :game_posting, foreign_key: true
  end
end

