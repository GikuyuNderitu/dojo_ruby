Rails.application.routes.draw do
  get 'times' => 'times#index'

  get 'times/restart' => 'times#restart'

  get 'says' => 'says#index'

  get 'hello' => 'says#hello'

  get 'say/hello' => 'says#say_hello'

  get 'say/hello/joe' => 'says#say_joe'

  get 'say/hello/michael' => 'says#say_michael'

  get 'times' => 'times#times'

  root 'says#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
