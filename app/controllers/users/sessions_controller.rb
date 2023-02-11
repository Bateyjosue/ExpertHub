class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    self.resource = warden.authenticate!(scope: :user, name: params[:user][:name], password: params[:user][:password])
    login_success && return if resource

    login_failed
  end

  def login_success
    render json: {
      message: 'You are logged In',
      user: resource,
      token: request.env['warden-jwt_auth.token'],
      status: 200
    }, status: :ok
  end

  def login_failed
    render json: {
      message: 'Invalid name or password',
      status: 401
    }, status: :unprocessable_entity
  end

  def respond_to_on_destroy
    authenticate_user!
    sign_out(:user)
    render json: {
      message: 'You are logged out',
      status: 204
    }, status: :ok
  end

  def log_out_success
    render json: {
      message: 'Signed out successfully',
      status: 204
    }, status: :ok
  end

  def log_out_failure
    render json: {
      message: 'User have no active session',
      status: 401
    }, status: :unauthorized
  end
end
