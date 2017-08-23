class Match < ApplicationRecord

  has_many :games

  def get_match_result
    game_done = 0
    self.games.each do |game|
      game_done +=1 unless !game.status
    end

    if game_done > 1
      away = 0
      home = 0

      team_away = Team.find(game.game_away.team_id)
      team_away.match_played += 1

      team_home = Team.find(game.game_home.team_id)
      team_home.match_played += 1

      team_away.save!
      team_home.save!

      self.games.each do |game|
        if game.home_winner
          home += 1
        elsif game.away_winner
          away += 1
        end
      end

      if away == 2
        self.winner = away_team_id
        self.loser = home_team_id
        self.save

        winning_team = Team.find(winner)
        winning_team.winning_count += 1
        winning_team.save
      elsif home == 2
        self.winner = away_team_id
        self.loser = home_team_id
        self.save

        winning_team = Team.find(winner)
        winning_team.winning_count += 1
        winning_team.save
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
