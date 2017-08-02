# Prefix Verb    URI Pattern                               Controller#Action

# questions GET    /questions(.:format)                    questions#index
#        POST   /questions(.:format)                       questions#create
# new_question GET    /questions/new(.:format)             questions#new
# edit_question GET    /questions/:id/edit(.:format)       questions#edit
# question GET    /questions/:id(.:format)                 questions#show
#        PATCH  /questions/:id(.:format)                   questions#update
#        PUT    /questions/:id(.:format)                   questions#update
#        DELETE /questions/:id(.:format)                   questions#destroy
#        POST   /questions/:id(.:format)                   answers#create
# questions_new POST   /questions/new(.:format)            questions#create
#        POST   /questions/:id/edit(.:format)              questions#update
# users_new POST   /users/new(.:format)                    users#create
# new_user GET    /users/new(.:format)                     users#new
#  users POST   /users(.:format)                           sessions#create
# logout GET    /logout(.:format)                          sessions#destroy
#  login GET    /users(.:format)                           users#index
#        POST   /answers/:id/edit(.:format)                answers#update
# answers GET    /answers(.:format)                        answers#index
#        POST   /answers(.:format)                         answers#create
# new_answer GET    /answers/new(.:format)                 answers#new
# edit_answer GET    /answers/:id/edit(.:format)           answers#edit
# answer GET    /answers/:id(.:format)                     answers#show
#        PATCH  /answers/:id(.:format)                     answers#update
#        PUT    /answers/:id(.:format)                     answers#update
#        DELETE /answers/:id(.:format)                     answers#destroy
#   root GET    /                                          users#index

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
