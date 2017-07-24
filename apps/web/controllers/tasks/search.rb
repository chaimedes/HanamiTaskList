module Web::Controllers::Tasks
  class Search
    include Web::Action

    expose :tasks

    def call(params)
      @tasks = TaskRepository.new.search(params)
    end
  end
end
