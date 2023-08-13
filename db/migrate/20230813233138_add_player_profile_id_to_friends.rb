class AddPlayerProfileIdToFriends < ActiveRecord::Migration[6.1]
  def change
    add_reference :friends, :player_profile, foreign_key: true
  end
end
