Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  get "/" => "home#index"



  get "/new_costumer" => "users#new_costumer"

  get "/new_clerk" => "users#new_clerk"

  resources :users

end
