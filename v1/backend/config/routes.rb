Rails.application.routes.draw do
  namespace :api do
    resources :user, only: [:create]
    resources :list, only: %i[create index update destroy]
    resources :recipe, only: %i[create index update destroy]
    post '/authentication', to: 'authentication#login'

    namespace :images do
      resources :recipe, only: [:create]
    end
  end
end
