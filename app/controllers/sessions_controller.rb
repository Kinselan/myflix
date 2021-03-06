class SessionsController < ApplicationController

  def new
    redirect_to home_path if current_user
	end

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome, you've logged in."
			redirect_to videos_path
		else
			flash.now[:error] = "Username or Password incorrect."
			# render :new  # why can't we render here?
      redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've logged out."
		redirect_to root_path
	end
end
