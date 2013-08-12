class UsersController < ApplicationController

	def index
		@background = ["1.jpg","2.jpg","3.jpg"].sample
		@user = User.new
	end

	def show
		get_forecast
	end

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			auto_login(@user)
			UserTexter.welcome_text(@user).deliver
			# WeatherWorker.perform_async(@user)
			redirect_to user_path(@user)
		else
			flash.now[:notice] = "nope"
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attriputes(user_params)
			redirect_to :back, notice: "updated"
		else
			render :edit, alert: "error!"
		end
	end

	def delete
	end


	def sms
		@user = current_user
		UserTexter.update_text(@user).deliver
		redirect_to user_path(@user)
	end


	private

		def user_params
			params.require(:user).permit(:username, :email, :phone_number, :carrier, :password, :lat, :lon)
		end


end
