Rails.application.routes.draw do
  get 'tasks/new'
  get 'tasks/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :tasks
  end

  resources :tasks

  get '/something', to: 'projects#something'

  get '/projects/overdue', to: 'projects#overdue', as: 'overdue'

  root 'application#home'
end
