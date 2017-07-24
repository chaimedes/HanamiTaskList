module Web::Controllers::Tasks
  class Search
    include Web::Action

    expose :tasks

    def call(params)
      @tasks = TaskRepository.new.search(params)
      redirect_to routes.tasks_path
    end
  end
end
