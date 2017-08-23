class UsersController < ApplicationController

  def index
    @player = User.new
    @players = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to players_path
    else
      redirect_to players_path
    end
  end

  def update
    
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :team_id)
  end

end
