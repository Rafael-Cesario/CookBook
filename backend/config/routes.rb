Rails.application.routes.draw do
  namespace :api do
    resources :user, only: [:create]
  end
end
