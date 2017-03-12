class UsersController < ApplicationController
	before_action :set_user, :only => [:show, :edit, :update, :destroy]

	def index
	end

	def new
	end

	def create
		@user = User.create(sanitize_params)
		if @user.save
			flash[:notice] = ['User successfully created']
			redirect_to "/users/#{@user.id}"
		else
			flash[:errors] = []
			@user.errors.full_messages.each do |msg|
				flash[:errors] << msg
			end
			redirect_to '/users/new'
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def sanitize_params
			params.require(:user).permit(:first_name, :last_name, :email)
		end

		def set_user
			@user = User.find(params[:id])
		end
end
