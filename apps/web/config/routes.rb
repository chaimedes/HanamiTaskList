# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/tasks', to: 'tasks#create', as: :create
post '/tasks/search', to: 'tasks#search', as: :search
get '/tasks/new', to: 'tasks#new', as: :new
get '/tasks', to: 'tasks#index', as: :tasks
delete '/tasks/:id', to: 'tasks#delete', as: :delete
root to: 'home#index'
