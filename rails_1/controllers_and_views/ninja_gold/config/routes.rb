Rails.application.routes.draw do
  root 'users#index'

  post 'money' => 'users#money'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
