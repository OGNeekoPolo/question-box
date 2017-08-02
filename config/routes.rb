Rails.application.routes.draw do

  resources :questions

  post 'questions/:id', to: 'answers#create'

  post '/questions/new', to: 'questions#create'

  post 'questions/:id/edit', to: 'questions#update'

  post 'users/new', to: 'users#create'

  get 'users/new', to: 'users#new', as: :new_user

  post '/users', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: :logout

  get '/users', to: 'users#index', as: :login

  post '/answers/:id/edit', to: 'answers#update'

  resources :answers

  root 'users#index'
end
