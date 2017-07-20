# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
#post '/tasks', to: 'tasks#create'
#get '/tasks/new', to: 'tasks#new'
#get '/tasks', to: 'tasks#index'
#root to: 'home#index'
root to: 'home#index'
resources :tasks, only: [:index, :new, :create]
