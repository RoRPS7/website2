Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: "users/passwords", registrations: 'users/registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tours
  resources :discounts
  resources :guides
  resources :attractions
  resources :categories
  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
