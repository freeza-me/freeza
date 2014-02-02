Freeza::Application.routes.draw do

  devise_for :users
  root "home#show"
  resources :fridges do
    resources :foods
  end
end
