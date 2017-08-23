class Game < ApplicationRecord

  belongs_to :game_away
  belongs_to :game_home

  validate :game_away_id, presence: true
  validate :game_home_id, presence: true
end
