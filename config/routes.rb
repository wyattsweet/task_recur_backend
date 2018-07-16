Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#index'
      get '/user', to: 'users#show'
      post '/users', to: 'users#create'
      post '/login', to: 'sessions#create'
    end
  end
end
