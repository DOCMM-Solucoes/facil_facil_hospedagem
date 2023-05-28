Rails.application.routes.draw do
  scope '(locale)', locale:/pt-BR|en/ do
      resources :guides
    resources :establishments
    resources :hoteliers
  end
end
