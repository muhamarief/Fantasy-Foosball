class ApplicationController < ActionController::Base
  include Authenticable
  helper_method :current_authenticatee
  protect_from_forgery with: :exception

end
