Rails.application.routes.draw do
  namespace :api do
    resources :user, only: [:create]
    resources :list, only: %i[create index update destroy]
    resources :recipe, only: [:create]
    post '/authentication', to: 'authentication#login'
  end
end
