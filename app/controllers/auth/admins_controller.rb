class Auth::AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to teams_path, notice: 'Logged In!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end


  def destroy
    session[:admin_id] = nil
    redirect_to root_path
  end
end
