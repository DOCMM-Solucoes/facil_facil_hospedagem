Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'pages#home'
  scope '(locale)', locale:/pt-BR|en/ do
    resources :guides
    resources :establishments
    resources :hoteliers
    resources :rooms
    resources :trips
  end
end
