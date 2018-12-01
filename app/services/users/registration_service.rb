# frozen_string_literal: true

module Users
  module RegistrationService
    module_function

    def register(user_params)
      User.create(user_params)
    end
  end
end
