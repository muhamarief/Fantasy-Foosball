module Authenticable
  extend ActiveSupport::Concern

  def current_authenticatee
    if session[:admin_id]
      @current_authenticatee ||= Admin.find(session[:admin_id])
    else
      nil
    end
  end

end
