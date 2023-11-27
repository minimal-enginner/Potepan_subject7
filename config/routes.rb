Rails.application.routes.draw do
  resources :profiles, only: [:show,:edit,:update]
  get "/search", to: "searches#search"
  root to: "searches#top"
  resources :rooms
  resources :reservations, only: [:index, :new, :confirm, :create, :show, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
  post '/rooms/:id', to: 'reservations#confirm'
  devise_for :users, module: "users"
  get "users/show" => "users#show"
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
