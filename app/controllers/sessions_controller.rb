class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
      if user
        log_in user
        redirect_to user
      else
        flash[:warning] = "User not found. Please Signup"
        redirect_to signup_path
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
