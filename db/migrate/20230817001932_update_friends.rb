class UpdateFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :friend_id, :integer
    add_foreign_key :friends, :player_profiles, column: :friend_id
    
    # Make sure to remove the old foreign key
    remove_foreign_key :friends, :player_profiles, column: :player_profile_id
    remove_index :friends, column: :player_profile_id
    
    # Rename the column for clarity
    rename_column :friends, :player_profile_id, :user_id
  end
end

