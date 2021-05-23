Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { passwords: "users/passwords", registrations: 'users/registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tours
  get "my_tours", to: "tours#my", as: "my_tours"
  get "my_tours/:id", to: "tours#my_show", as: "my_tour"
  resources :discounts
  resources :guides
  resources :attractions
  post "attractions/add_to_cart/:id", to: "attractions#add_to_cart", as: "add_to_cart"
  delete "attractions/remove_from_cart/:id", to: "attractions#remove_from_cart", as: "remove_from_cart"
  get "/cart", to: "cart#index"
  delete "cart", to: "cart#destroy"
  post '/cart' => 'cart#create'
  resources :categories
  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
