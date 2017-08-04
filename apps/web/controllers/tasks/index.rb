module Web::Controllers::Tasks
  class Index
    include Web::Action

    expose :tasks
    expose :user

    params do
      optional(:identifier).filled(:str?)
    end

    def do_bind
      binding.pry
    end

    def call(params)
      if params[:identifier]
        @user = UserRepository.new.find_by_identifier(params[:identifier])
      end
      @tasks = TaskRepository.new.by_importance
    end
  end
end
