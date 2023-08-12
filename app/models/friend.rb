class Friend < ApplicationRecord
    belongs_to :player_profile

    validates :invite_status, presence: true
end
