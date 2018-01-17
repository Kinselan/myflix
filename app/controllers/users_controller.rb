class UsersController < ApplicationController

  before_action :require_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You've successfully registered an are now logged-in."
      session[:user_id] = @user.id
      AppMailer.send_welcome_email(@user).deliver
      redirect_to videos_path
    else
      flash[:error] = "We can't let you in like that! Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
