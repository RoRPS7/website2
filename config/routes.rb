Rails.application.routes.draw do
  get 'cart/index'
  devise_for :users, controllers: { passwords: "users/passwords", registrations: 'users/registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tours
  resources :discounts
  resources :guides
  resources :attractions
  post "attractions/add_to_cart/:id", to: "attractions#add_to_cart", as: "add_to_cart"
  delete "attractions/remove_from_cart/:id", to: "attractions#remove_from_cart", as: "remove_from_cart"
  get "/cart", to: "cart#index"
  resources :categories
  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
