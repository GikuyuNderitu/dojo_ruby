class TimesController < ApplicationController
  def index
	unless session[:times]
		  session[:times] = 1
	else
		session[:times] += 1
	end
	  render :text => "You visted this url #{session[:times]} time(s)!"
  end

  def restart
	  session.delete('times')
	  render :text => 'Destroyed the session!'
  end
end
