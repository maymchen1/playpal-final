class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :invite_status
      t.references :player_profile, foreign_key: true
      t.belongs_to :player_profile, null: false, foreign_key: true


      t.timestamps
    end
  end
end
 