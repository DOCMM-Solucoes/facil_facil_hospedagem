Rails.application.routes.draw do
  resources :guides
  scope '(locale)', locale:/pt-BR|en/ do
    resources :guides
  end
end
