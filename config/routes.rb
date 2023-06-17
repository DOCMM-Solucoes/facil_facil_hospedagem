Rails.application.routes.draw do
  scope '(locale)', locale:/pt-BR|en/ do
    devise_for :users
    root 'pages#home'
    resources :photos
    resources :guides
    resources :establishments
    resources :hoteliers
    resources :rooms
    resources :trips
  end
end
