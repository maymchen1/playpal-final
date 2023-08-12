class Description < ApplicationRecord
    belongs_to :game_posting

    validates :genre, presence: true
    validates :player_limit, presence: true
    validates :description_text, presence: true
    validates :description_title, presence: true
end
