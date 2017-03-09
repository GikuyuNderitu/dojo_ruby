class TimesController < ApplicationController
  def index
	  @time = format = Time.new.strftime("%b %d, %Y\n%I:%M %p")
  end
end
