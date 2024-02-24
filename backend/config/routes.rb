Rails.application.routes.draw do
  namespace :api do
    resources :user, only: [:create]
    resources :list, only: [:create, :index, :update]
    post "/authentication", to: "authentication#login"
  end
end
