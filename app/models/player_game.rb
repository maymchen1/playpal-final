class PlayerGame < ApplicationRecord
  belongs_to :player_profile_id
  belongs_to :game_posting_id
end
