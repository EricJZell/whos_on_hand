class VolunteersController < ApplicationController

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @volunteer = @user.volunteers.new
  end

  def create
    @user = User.find(params[:user_id])
    @volunteer = @user.volunteers.new(volunteer_params)
    if @volunteer.save
      flash[:success] = 'New volunteer created!'
      redirect_to user_path(@user)
    else
      flash[:alert] = @volunteer.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy
    @user = User.find(params[:user_id])
    flash[:primary] = "Volunteer Deleted Successfully"
    redirect_to user_path(@user)
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
    @user = @volunteer.user
  end

  def update
    @user = User.find(params[:user_id])
    @volunteer = Volunteer.find(params[:id])
    @volunteer.update_attributes(volunteer_params)
    if @volunteer.save
      flash[:success] = 'Volunteer updated!'
      redirect_to user_path(@user)
    else
      flash[:alert] = @volunteer.errors.full_messages.join(', ')
      render :edit
    end
  end

  protected

  def volunteer_params
    params.require(:volunteer).permit(
      :name, :phone_number, :mac_address, :credentials
    )
  end

end
