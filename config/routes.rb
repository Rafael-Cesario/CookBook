Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  post 'user' => 'user#create'
  post 'authentication' => 'authentication#login'

  resources 'list', only: %w[create index update destroy]
  resources 'recipe', only: %w[create index update destroy]
end
