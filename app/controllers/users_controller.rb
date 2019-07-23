class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Please add your name"
      render 'sessions/new'
    end
  end
  private

  def user_params
    params.require(:user).permit(:name)
  end

  
end


