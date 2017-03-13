class MessagesController < ApplicationController
	before_action :set_user
	def index
		@messages = Message.all
	end

	def create
		message = Message.create(sanitize_params)
		if message.errors
			flash[:errors] = []
			message.errors.full_messages.each do |msg|
				flash[:errors] << msg
			end
		else
			flash[:notice] = ["Successfully posted new Post"]
		end
		redirect_to '/messages'
	end

	private
		def set_user
			unless session[:uid]
				flash[:errors] = ["I'm sorry, you must first log in to view the site. It really is quite simple. Stop trying to circumvent me rapscallion ;)."]
				redirect_to '/'
			end
			@name = session[:username]
		end

		def sanitize_params
			user = User.find(session[:uid])
			db_hash = params.require(:message).permit(:message)
			db_hash[:user] = user
			db_hash
		end
end
