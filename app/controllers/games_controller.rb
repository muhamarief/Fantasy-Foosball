class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params) && @game.status
      @game.set_game_result
      @game.match.get_match_result
      redirect_to matches_path
    else
      redirect_to matches_path
    end
  end

  def destroy
  end

  private
  def game_params
    params.require(:game).permit(:away_score, :home_score, :away_winner?, :home_winner?, :status)
  end

end
