Rails.application.routes.draw do
  namespace :api do
    post '/users', to: 'user#create'
  end
end
