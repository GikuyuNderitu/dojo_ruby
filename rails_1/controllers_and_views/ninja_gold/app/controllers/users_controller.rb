class UsersController < ApplicationController
  def index
	  if session[:messages]
		  @messages = session[:messages]
		  @gold_count = session[:gold_count]
	  else
		  session[:messages] = []
		  @messages = []
		  session[:gold_count] = 0
		  @gold_count = 0
	  end
  end

  def money
	building = params[:golds]['building']
	puts session[:messages]

	case building
		when 'farm'
			gold = rand(10..20)
		when 'cave'
			gold = rand(5..10)
		when 'house'
			gold = rand(2..5)
		when 'casino'
			gold = rand(-50..50)
	end
	session[:gold_count] += gold
	time = Time.new.strftime("%Y/%m/%d %I:%M %p")


	if gold >= 0
		new_class = 'green'
		new_message = ("Earned #{gold} from the #{building}! (#{time})")
	else
		new_class = 'red'
		new_message = ("Entered a casino and lost #{gold} golds ... (#{time})")
	end
	new_gold = {:my_class => new_class, :msg => new_message}
	session[:messages] << new_gold

	redirect_to '/'
  end
end
