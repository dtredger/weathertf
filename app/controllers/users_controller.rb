class UsersController < ApplicationController

	def index
		@user = User.new
	end

	def show
	end

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render :create, notice: "well played"
			UserTexter.welcome_text(@user).deliver
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


	private

		def user_params
			params.require(:user).permit(:username, :email, :phone_number, :carrier, :password)
		end


end
