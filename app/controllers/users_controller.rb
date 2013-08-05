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
		@user = User.new(user_params)
		if @user.save
			UserTexter.welcome_text(@user).deliver
			# render :create, notice: "well played"          so we can read the email
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
