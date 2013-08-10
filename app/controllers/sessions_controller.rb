class SessionsController < ApplicationController
	def new
	end

	def create
		user = login(params[:username], params[:password])
		if user
			redirect_to user_path(user)
		else
			redirect_to :root
		end
	end

	def delete
		logout
		redirect_to root_url, notice: "logged out"
	end

end
