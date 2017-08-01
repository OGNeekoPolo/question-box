Rails.application.routes.draw do

  resources :answers

  resources :questions

  post '/questions/new', to: 'questions#create'

  post 'questions/:id/edit', to: 'questions#update'

  post 'answers/new', to: 'answers#create'

  post 'users/new', to: 'users#create'

  get 'users/new', to: 'users#new', as: :new_user

  post '/users', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: :logout

  get '/users', to: 'users#index', as: :login

  root 'users#index'
end
