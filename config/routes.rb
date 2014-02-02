Freeza::Application.routes.draw do
  root "home#show"
  resources :foods
end
