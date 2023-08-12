class PlayerGame < ApplicationRecord
  belongs_to :player_profile
  belongs_to :game_posting
end
