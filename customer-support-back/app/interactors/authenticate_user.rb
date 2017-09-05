class AuthenticateUser
  include Interactor

  def call
    if user
      context.token = JsonToken.encode(user_id: user.id)
    else
      context.fail!(message: 'authenticate_user.failure')
    end
  end

  private 

  def user
    user = User.find_by_email(context.email)
    if user && user.authenticate(context.password)
      context.user = user
      return user
    end
  end
end
