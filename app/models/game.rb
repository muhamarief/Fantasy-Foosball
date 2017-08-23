class Game < ApplicationRecord

  belongs_to :game_away
  belongs_to :game_home
  belongs_to :match

  validates :game_away_id, presence: true
  validates :game_home_id, presence: true

  def set_game_result
    if self.home_score > self.away_score
      self.home_winner = true
      self.save
    else
      self.away_winner = true
      self.save
    end
    self.match.check_game_wins_each_match
  end




end
