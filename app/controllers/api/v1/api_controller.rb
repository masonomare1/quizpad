module Api
  module V1
    class ApiController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Pundit::Authorization
      include ExceptionHandler
    end
  end
end
