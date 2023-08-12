class PlayerProfile < ApplicationRecord
    has_many :player_game
    has_many :game_posting, through: :player_game
    has_many :friend
end
