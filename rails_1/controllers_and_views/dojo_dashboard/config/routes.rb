Rails.application.routes.draw do
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
