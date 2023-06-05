Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  scope '(locale)', locale:/pt-BR|en/ do
      resources :guides
    resources :establishments
    resources :hoteliers
  end
end
