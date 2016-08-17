class UsersController < ApplicationController

  def show
    @user = User.includes(:volunteers).find(params[:id])
  end

end
