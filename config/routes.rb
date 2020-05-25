Rails.application.routes.draw do

  get "/" => "home#index"



  get "/new_costumer" => "users#new_costumer"



  get "/clerks" => "users#clerk"



  resources :menu_items



  get "/reports" => "sessions#reports"



  get "/signin" => "sessions#new"



  post "/signin" => "sessions#create"



  post "/walkin_costumer" => "orders#walkin_costumer"



  get "/walkin_costumer" => "orders#walkin_costumer_orders"



  put "walkin_costumer/:id" => "orders#walkin_costumer_order_confirm"



  delete "/signout" => "sessions#destroy"



  get "/costumer_home" => "sessions#costumer_home"



  get "/clerk_home" => "sessions#clerk_home"



  get "/admin_home" => "sessions#admin_home"



  get "/pending_orders" => "orders#pending_orders"



  put "/pending_orders/:id" => "orders#mark_as_delivered"



  resources :users



  resources :order_items



  resources :orders

end
