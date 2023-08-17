class Friendship < ApplicationRecord
    belongs_to :user, class_name: 'PlayerProfile'
    belongs_to :friend, class_name: 'PlayerProfile'
  end
  