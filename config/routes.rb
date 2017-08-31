#             Prefix Verb       URI Pattern                                  Controller#Action
#            new_user GET    /users/new(.:format)                               users#new
#               users POST   /users(.:format)                                   sessions#create
#              logout GET    /logout(.:format)                                  sessions#destroy
#               login GET    /users(.:format)                                   users#index
#    question_answers GET    /questions/:question_id/answers(.:format)          answers#index
#                     POST   /questions/:question_id/answers(.:format)          answers#create
# new_question_answer GET    /questions/:question_id/answers/new(.:format)      answers#new
# edit_question_answer GET    /questions/:question_id/answers/:id/edit(.:format) answers#edit
#     question_answer GET    /questions/:question_id/answers/:id(.:format)      answers#show
#                     PATCH  /questions/:question_id/answers/:id(.:format)      answers#update
#                     PUT    /questions/:question_id/answers/:id(.:format)      answers#update
#                     DELETE /questions/:question_id/answers/:id(.:format)      answers#destroy
#           questions GET    /questions(.:format)                               questions#index
#                     POST   /questions(.:format)                               questions#create
#        new_question GET    /questions/new(.:format)                           questions#new
#       edit_question GET    /questions/:id/edit(.:format)                      questions#edit
#            question GET    /questions/:id(.:format)                           questions#show
#                     PATCH  /questions/:id(.:format)                           questions#update
#                     PUT    /questions/:id(.:format)                           questions#update
#                     DELETE /questions/:id(.:format)                           questions#destroy
#                root GET    /                                                  users#index
Rails.application.routes.draw do



  post '/questions/new', to: 'questions#create'

  post 'questions/:id/edit', to: 'questions#update'

  post 'questions/:id', to: 'answers#create'


  post 'users/new', to: 'users#create'

  get 'users/new', to: 'users#new', as: :new_user

  post '/users', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: :logout

  get '/users', to: 'users#index', as: :login

  post '/questions/:question_id/answers/:id/edit', to: 'answers#update'

  resources :questions do
    resources :answers
  end

  root 'questions#index'
end
