Rails.application.routes.draw do

  get "/" => "home#index"



  get "/new_costumer" => "users#new_costumer"



  get "/new_clerk" => "users#new_clerk"



  get "/signin" => "sessions#new"

  post "/signin" => "sessions#create"

  delete "/signout" => "sessions#destroy"

  get "/costumer_home" => "sessions#costumer_home"



  get "/clerk_home" => "sessions#clerk_home"



  get "/admin_home" => "sessions#admin_home"



  resources :users

end
