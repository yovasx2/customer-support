class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    authentication = AuthenticateUser.call(authentication_params)
    if authentication.success?
      response.headers['Authorization'] = authentication.token
      render json: authentication.user, except: :password_digest
    else
      render json: { error: authentication.message }, status: :unauthorized
    end 
  end 

  private

  def authentication_params
    params.permit(:email, :password)
  end
end
