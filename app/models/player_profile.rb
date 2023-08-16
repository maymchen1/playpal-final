class PlayerProfile < ApplicationRecord
    has_many :player_games
    has_many :game_postings, through: :player_games

    has_many :friends

    validates :username, presence: true
    validates :email, presence:true

    has_secure_password
end
