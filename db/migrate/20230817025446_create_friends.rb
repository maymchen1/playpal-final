class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :invite_status
      t.references :player_profile, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :player_profiles }

      t.timestamps
    end
  end
end
