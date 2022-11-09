class ApplicationController < ActionController::Base
  def current_user
    User.find(params[:user_id])
  end
end
