class GamePosting < ApplicationRecord
    has_many :player_game
    has_many :player_profile, through: :player_game
    has_one :description 
end
