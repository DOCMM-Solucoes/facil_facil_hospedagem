Rails.application.routes.draw do

  resources :hoteliers

  scope '(locale)', locale:/pt-BR|en/ do
    resources :establishments
  end
end
