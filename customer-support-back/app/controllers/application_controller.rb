class ApplicationController < ActionController::Base
  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    token = request.headers['Authorization']
    authentication = AuthenticateRequest.call(token: token)
    if authentication.success?
      render json: authentication.user
    else
      render json: { error: authentication.message }, status: :unauthorized
    end
  end
end
