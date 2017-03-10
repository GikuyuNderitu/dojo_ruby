class StudentsController < ApplicationController
	before_action :set_dojo
	before_action :set_student, only: [:show, :edit, :update, :destroy]

	def index
		@students = @dojo.students
	end

	def show
		time = @student.created_at.to_time.strftime("%Y-%m-%d")
		print time
		@students = @dojo.students.where("created_at LIKE '#{time}%'")
	end

	def new
		@dojos = Dojo.where.not(id: @dojo.id)
	end

	def edit
		@dojos = Dojo.where.not(id: @dojo.id)
	end

	def create
		student = Student.create(sanitize_student)
		unless student.valid?
			puts 'HIT ERRORS'
			flash[:errors] = []
			student.errors.full_messages.each do |msg|
				flash[:errors].push(msg)
			end
			redirect_to "/dojos/#{@dojo.id}/students/new"
		else
			flash[:success] = "Successfully added #{student.first_name} #{student.last_name} to #{@dojo.branch}!"
			redirect_to "/dojos/#{@dojo.id}/students"
		end
	end

	def update
		@student.update(sanitize_student)
		unless @dojo.valid?
			flash[:errors] = []
			@dojo.errors.full_messages.each do |msg|
				flash[:errors].push(msg)
			end
		else
			flash[:success] = "Successfully updated student #{@student.first_name} #{@student.last_name}!"
		end
		redirect_to "/dojos/#{@dojo.id}/students/#{@student.id}/edit"
	end

	def destroy
		@student.destroy
		redirect_to "/dojos/#{@dojo.id}/students"
	end

	private
		def set_dojo
			@dojo = Dojo.find(params[:dojo_id])
		end

		def set_student
			@student = Student.find(params[:id])
		end

		def sanitize_student
			dojo = Dojo.find(params[:dojo])
			db_hash = params.require(:student).permit(:first_name, :last_name, :email)
			db_hash[:dojo] = dojo
			db_hash
		end
end
