Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
