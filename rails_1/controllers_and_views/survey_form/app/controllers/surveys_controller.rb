class SurveysController < ApplicationController
  def index
	  unless session[:count]
	  	session[:count] = 0
	  end
  end

  def result
	  survey =  session[:survey]
	  puts survey["name"]
	  @name = survey["name"]
	  @loc = survey["loc"]
	  @lang = survey["lang"]
	  if survey["comment"]
		  @comment = survey["comment"]
	  end
  end

  def create

	  session[:survey] = params[:survey]
	  session[:count] += 1

	  flash[:response] = "Thanks for submitting this form! You have submitted this form #{session[:count]} times now."

	  redirect_to '/surveys/result'
  end
end
