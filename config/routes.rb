Freeza::Application.routes.draw do
  resources :fridges

  devise_for :users
  root "home#show"
  resources :foods
end
