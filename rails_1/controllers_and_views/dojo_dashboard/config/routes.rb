Rails.application.routes.draw do
  # *** *** *** *** *** *** ***
  # Dojo_Student Routes
  # *** *** *** *** *** *** *** ***#
  get 'dojos/:dojo_id/students' => 'students#index'

  get 'dojos/:dojo_id/students/new' => 'students#new'


  get 'dojos/:dojo_id/students/:id/edit' => 'students#edit'

  post 'dojos/:dojo_id/students' => 'students#create'

  get 'dojos/:dojo_id/students/:id' => 'students#show'

  put 'dojos/:dojo_id/students/:id' => 'students#update'

  patch 'dojos/:dojo_id/students/:id' => 'students#update'

  delete 'dojos/:dojo_id/students/:id' => 'students#destroy'

  # *** *** *** *** *** *** *** ***#
  # Dojo Routes
  # *** *** *** *** *** *** *** ***#

  get 'dojos' => 'dojos#index'

  get 'dojos/new' => 'dojos#new'

  get 'dojos/:id/edit' => 'dojos#edit'

  get 'dojos/:id' => 'dojos#show'

  post 'dojos' => 'dojos#create'

  put 'dojos/:id' => 'dojos#update'

  patch 'dojos/:id' => 'dojos#update'

  delete 'dojos/:id' => 'dojos#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
