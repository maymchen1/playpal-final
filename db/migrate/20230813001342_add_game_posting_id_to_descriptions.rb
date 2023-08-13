class AddGamePostingIdToDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :descriptions, :game_posting, foreign_key: true
  end
end

