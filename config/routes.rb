Rails.application.routes.draw do
  get "users/profile" => "users#show"
  get "users/profile/edit" => "users#edit"
  root to: "rooms#index"
  resources :rooms
  resources :reservations
  devise_for :users, module: "users"
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
