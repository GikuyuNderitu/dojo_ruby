Rails.application.routes.draw do
	# *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
	# User Routes
	# *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
	root 'users#new'

	post 'users/sign_in' => 'users#sign_in'

	get '/logout' => 'users#logout'

	# *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
	# Message Routes
	# *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***

	get 'messages' => 'messages#index'

	post 'messages/create'

	# *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
	# Comment Routes
	# *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
	post 'comments/:id/create' => 'comments#create'

end
