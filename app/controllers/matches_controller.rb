class MatchesController < ApplicationController

  def index
    @match = Match.new
    @matches = Match.order(id: :asc)
  end

  def show
    @match = Match.find(params[:id])
    @games = @match.games.order(id: :asc)
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      game_away = GameAway.new(team_id: @match.away_team_id)
      game_home = GameHome.new(team_id: @match.home_team_id)

      game_away.save!
      game_home.save!

      3.times do
        game = Game.new(away_score: 0, home_score: 0, away_winner: false, home_winner: false, game_away_id: game_away.id, game_home_id: game_home.id, status: false, match_id: @match.id)
        game.save!
      end

      game_away.team.match_played += 1


      redirect_to matches_path
    else
      redirect_to matches_path
    end
  end

  def edit
  end

  def update

  end

  def destroy
  end

  def match_params
    params.require(:match).permit(:away_team_id, :home_team_id, :winner, :loser)
  end
end
