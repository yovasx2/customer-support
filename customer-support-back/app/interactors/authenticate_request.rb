class AuthenticateRequest 
  include Interactor

  def call
    context.user = user
  end

  private

  def user
    return @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    context.fail!(message: 'authenticate_request.invalid_token')
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonToken.decode(http_auth_header)
  end

  def http_auth_header
    if context.token.present?
      return context.token
    else
      context.fail!(message: 'authenticate_request.token_missing')
    end
  end
end
