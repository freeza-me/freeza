Freeza::Application.routes.draw do

  devise_for :users

  root "home#show"

  namespace "kitchen" do
    get "board"
  end

  resources :fridges do
    resources :foods
  end
end
