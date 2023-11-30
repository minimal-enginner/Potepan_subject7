Rails.application.routes.draw do
  resources :profiles, only: [:show,:edit,:update]
  get "/search", to: "searches#search"
  get "/keyword_search", to: "searches#keyword_search"
  get "/reservations/confirm", to: "reservations#confirm"
  get "/reservations/:id/edit_confirm", to: "reservations#edit_confirm"
  root to: "searches#top"
  resources :rooms
  resources :reservations, only: [:index, :new, :confirm, :create, :show, :edit, :destroy, :update] do
    collection do
      post :confirm
      # patch :confirm
    end
    member do
      # post :edit_confirm
      patch :edit_confirm
    end
  end
  post '/rooms/:id', to: 'reservations#confirm'
  devise_for :users, module: "users"
  get "users/show" => "users#show"
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
