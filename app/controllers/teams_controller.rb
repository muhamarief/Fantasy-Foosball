class TeamsController < ApplicationController

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
    else
      redirect_to teams_path
    end
  end

  def index
    @team = Team.new
    @teams = Team.all
    @top_teams = @teams.sort_by{|x| x.winning_count / x.match_played}
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

end
