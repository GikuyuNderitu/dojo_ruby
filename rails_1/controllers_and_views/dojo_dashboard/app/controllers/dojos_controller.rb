class DojosController < ApplicationController
  before_action :set_dojo, only: [:show, :edit, :update, :destroy]

  def index
	  @dojos = Dojo.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
	  dojo = Dojo.new(sanitize_dojo)
	  unless dojo.valid?
		  puts 'HIT ERRORS'
		  flash[:errors] = []
		  dojo.errors.full_messages.each do |msg|
			  flash[:errors].push(msg)
		  end
		  return redirect_to '/dojos/new'
	  else
		  dojo.save
		  flash[:success] = 'Successfully generated dojo!'
		  return redirect_to '/dojos'
	  end
  end

  def update
	  @dojo.update(sanitize_dojo)
	  unless @dojo.valid?
		  flash[:errors] = []
		  @dojo.errors.full_messages.each do |msg|
			  flash[:errors].push(msg)
		  end
	  else
		  flash[:success] = 'Successfully generated dojo!'
	  end
	  redirect_to "/dojos/#{params[:id]}/edit"
  end

  def destroy
	  @dojo.destroy
	  redirect_to '/dojos'
  end

  private
	  def sanitize_dojo
		  params.require(:dojo).permit(:branch, :street, :city, :state)
	  end

	  def set_dojo
		  @dojo = Dojo.find(params[:id])
	  end
end
