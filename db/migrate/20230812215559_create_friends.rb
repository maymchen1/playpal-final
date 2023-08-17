class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: { to_table: :player_profiles }
      t.references :friend, null: false, foreign_key: { to_table: :player_profiles }
      t.string :invite_status
      
      t.timestamps
    end
  end
end
