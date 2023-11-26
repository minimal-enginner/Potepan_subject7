Rails.application.routes.draw do
  get "users/profile" => "users#show"
  get "users/profile/edit" => "users#edit"
  get "/search", to: "searches#search"
  root to: "searches#search"
  resources :rooms
  resources :reservations
  post '/rooms/:id', to: 'reservations#confirm'
  devise_for :users, module: "users"
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
