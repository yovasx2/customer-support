Rails.application.routes.draw do
  post 'users/authenticate', to: 'authentication#authenticate'
end
