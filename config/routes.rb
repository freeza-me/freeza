Freeza::Application.routes.draw do

  devise_for :users

  root "home#show"

  post "locale", to: "locale#update"

  namespace "kitchen" do
    get "board"
  end

  resources :fridges, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      post 'inbound'
    end
    resources :foods, only: [:new, :create, :edit, :update, :destroy]
  end
end
