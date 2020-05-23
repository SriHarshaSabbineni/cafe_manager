Rails.application.routes.draw do

  get "/" => "home#index"



  get "/new_costumer" => "users#new_costumer"



  get "/clerks" => "users#clerk"



  resources :menu_items



  get "/reports" => "sessions#reports"



  get "/signin" => "sessions#new"



  post "/signin" => "sessions#create"



  delete "/signout" => "sessions#destroy"



  get "/costumer_home" => "sessions#costumer_home"



  get "/clerk_home" => "sessions#clerk_home"



  get "/admin_home" => "sessions#admin_home"



  resources :users

  resources :order_items

  resources :orders

end
