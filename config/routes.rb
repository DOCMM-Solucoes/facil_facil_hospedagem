Rails.application.routes.draw do
  get 'welcome/index'
  scope '(locale)', locale:/pt-BR|en/ do
    devise_for :users
    root 'welcome#index'
    resources :photos
    resources :guides
    resources :establishments
    resources :hoteliers
    resources :rooms
    resources :trips
  end
end
