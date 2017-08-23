class Match < ApplicationRecord

  has_many :games

  def get_match_result
    game_done = 0
    self.games.each do |game|
      game_done +=1 unless !game.status
    end

    if game_done == 3
      away = 0
      home = 0

      self.games.each do |game|
        game.home_winner ? home += 1 : away += 1
      end

      if away == 2
        self.winner = away_team_id
      elsif home == 2
        self.winner = home_team_id
      end

    end
  end

  def check_game_wins_each_match
    away = 0
    home = 0

    self.games.each do |game|
      if game.home_winner
        home += 1
      elsif game.away_winner
        away += 1
      end
    end

    if away == 2 || home == 2
      self.games.order(id: :asc).last.destroy
      self.get_match_result
    end
  end
end
