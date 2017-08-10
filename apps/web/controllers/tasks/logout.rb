module Web::Controllers::Tasks
  class Logout
    include Web::Action

    expose :tasks
    expose :users

    def do_bind
      binding.pry
    end

    def call(params)
      session[:logged_in] = false
      redirect_to routes.tasks_path
    end
  end
end
