class AddPasswordDigestToPlayerProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :player_profiles, :password_digest, :string
  end
end
