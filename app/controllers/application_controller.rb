class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from StandardError, :with => :error_api

  def error_api(e = nil)
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")
    render json: {status: "ng", code: 500, content: {message: "#{e.message}"} }
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
