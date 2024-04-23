Rails.application.routes.draw do
  namespace :api do
    post '/users', to: 'user#create'
    post '/authentication', to: 'authentication#login'
  end
end
