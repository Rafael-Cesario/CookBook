Rails.application.routes.draw do
  namespace :api do
    resources :user, only: [:create]
    resources :list, only: [:create, :index]
    post "/authentication", to: "authentication#login"
  end
end
