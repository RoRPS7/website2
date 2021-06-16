Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { passwords: "users/passwords", registrations: 'users/registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "przykladowe_trasy", to: "tours#index", as: "tours"
  get "przykladowa_trasa_nr_:id", to: "tours#show", as: "tour"
  get "moje_trasy", to: "tours#my", as: "my_tours"
  get "moja_trasa_nr_:id", to: "tours#my_show", as: "my_tour"
  delete 'przykladowa_trasa_nr_:id' => 'tours#destroy'
  get "tours/add_to_my_tours/:id", to: "tours#add_to_my_tours", as: "add_to_my_tours"

  get "oferowane_znizki", to: "discounts#index", as: "discounts"

  get "nasi_przewodnicy", to: "guides#index", as: "guides"

  get "atrakcje", to: "attractions#index", as: "attractions"
  get "atrakcja_nr_:id", to: "attractions#show", as: "attraction"

  post "cart/add_to_cart/:id", to: "cart#add_to_cart", as: "add_to_cart"
  get "cart/remove_from_cart/:id", to: "cart#remove_from_cart", as: "remove_from_cart"
  get "cart", to: "cart#index"
  post '/cart' => 'cart#create'

  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
