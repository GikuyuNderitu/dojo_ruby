class UsersController < ApplicationController
	def new
	end

	def logout
		reset_session
		redirect_to '/'
	end

	def sign_in
		username = sanitize_params
		user = User.find_by_username(username)

		unless user
			user = User.create(username: username)
		end

		if user.invalid?
			flash[:errors] = []
			user.errors.full_messages.each do |msg|
				flash[:errors] << msg
			end
			return redirect_to '/'
		end

		session[:uid] = user.id
		session[:username] = user.username
		redirect_to '/messages'
	end
	private
		def sanitize_params
			params.require(:user).permit(:username)[:username]
		end
end
