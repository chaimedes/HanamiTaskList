module Web::Controllers::Users
  class New
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:identifier).filled(:str?)
      end
    end

    def do_bind
      binding.pry 
    end

    def generate_identifier
      { identifier: (0...10).map { ('a'..'z').to_a[Kernel.rand(26)] }.join }
    end

    def call(params)
      
      # This is the base identifier
      identifier = generate_identifier 

      # Create a user with it.
      new_user = UserRepository.new.create(identifier)
      
      # Get the user's new id. 
      new_user_id = new_user.to_h[:id].to_s

      # Identifier string with ID appended will be used for login.
      identifier_to_pass_back = identifier[:identifier] + new_user_id

      redirect_to routes.init_path(identifier: identifier_to_pass_back)
    end
  end
end
