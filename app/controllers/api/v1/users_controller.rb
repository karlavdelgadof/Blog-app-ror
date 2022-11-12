class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :authenticate_user!
  def index
    render json: User.all
  end

  def show
    render json: User.find_by(id: params[:id])
  end
end
