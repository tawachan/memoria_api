class ApplicationController < ActionController::API

  rescue_from StandardError, :with => :error_api

  def error_api(e = nil)
    render json: {status: "ng", code: 500, content: {message: "#{e.message}"} }
  end
end
