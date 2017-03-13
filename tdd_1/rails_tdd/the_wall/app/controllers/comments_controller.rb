class CommentsController < ApplicationController
	before_action :set_data
	def create
		comment = Comment.create(set_data)
		if comment.errors
			flash[:errors] = []
			comment.errors.full_messages.each do |val|
				flash[:errors] << val
			end
		end
		redirect_to '/messages'
	end

	private
		def set_data
			user = User.find(session[:uid])
			msg = Message.find(params[:id])
			db_hash = params.require(:comment).permit(:comment)
			db_hash[:user] = user
			db_hash[:message] = msg
			db_hash
		end
end
