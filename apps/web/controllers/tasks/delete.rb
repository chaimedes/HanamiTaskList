module Web::Controllers::Tasks
  class Delete
    include Web::Action

    expose :task

    def call(params)
      TaskRepository.new.delete(params[:id])
      redirect_to routes.tasks_path
    end
  end
end
