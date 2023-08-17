class UpdateFriends < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :friendships, :player_profiles, column: :user_id
    remove_index :friendships, column: :user_id
    
    # Rename the column for clarity
    rename_column :friendships, :user_id, :user_profile_id
  end
end
