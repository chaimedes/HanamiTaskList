# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/tasks', to: 'tasks#create', as: :create
#post '/tasks/user', to: 'user#new', as: :user
get '/users/new', to: 'users#new', as: :user
post '/tasks/search', to: 'tasks#search', as: :search
post '/tasks', to: 'tasks#index', as: :init
get '/tasks/new', to: 'tasks#new', as: :new
get '/tasks', to: 'tasks#index', as: :tasks
get '/tasks/logout', to: 'tasks#logout', as: :logout
post '/tasks/login', to: 'tasks#login', as: :login
delete '/tasks/:id', to: 'tasks#delete', as: :delete
root to: 'tasks#index'
