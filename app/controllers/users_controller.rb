class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:volunteers).find(params[:id])
  end

end
