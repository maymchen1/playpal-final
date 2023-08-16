class GamePosting < ApplicationRecord
    has_many :player_games
    has_many :player_profiles, through: :player_games

    has_one :description 

    validates :title, presence: true
end
