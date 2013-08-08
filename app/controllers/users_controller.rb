class UsersController < ApplicationController

	def index
		@background = ["1.jpg","2.jpg","3.jpg"].sample
		@user = User.new
	end

	def show
	end

	def new
	end

	def create
		sds
		@user = User.new(user_params)
		if @user.save
			UserTexter.welcome_text(@user).deliver
			render :create, notice: "well played"
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


	def display_location
		@lat = User.params(lat)
		@lon = User.params(lon)
	end


	private

		def user_params
			params.require(:user).permit(:username, :email, :phone_number, :carrier, :password, :lat, :lon)
		end


end
