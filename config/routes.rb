Freeza::Application.routes.draw do

  devise_for :users

  root "home#show"

  namespace "kitchen" do
    get "board"
  end

  resources :fridges, only: [:new, :create, :edit, :update, :destroy] do
    resources :foods, only: [:new, :create, :edit, :update, :destroy]
  end
end
