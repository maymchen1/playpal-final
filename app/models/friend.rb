class Friend < ApplicationRecord
    belongs_to :player_profile
    belongs_to :friend, class_name: 'PlayerProfile'
    validates :invite_status, presence: true
end
