module Web::Controllers::Tasks
  class Login
    include Web::Action

    expose :tasks
    expose :users

    #params do
    #  required(:identifier).filled(:str?)
    #end

    def do_bind
      binding.pry
    end

    def call(params)
      fine_then_use_this = params.raw["user"]["identifier"]
      ident = fine_then_use_this[0..-3]
      id = fine_then_use_this[ident.size..-1]
      do_bind
      if UserRepository.new.find_by_id_and_identifier(id, ident).count > 0
        session[:logged_in] = true
      end
      redirect_to routes.tasks_path
    end
  end
end
