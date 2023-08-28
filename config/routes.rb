Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'
  resources :photos
  resources :guides
  resources :establishments
  resources :hoteliers
  resources :rooms
  resources :trips
end
