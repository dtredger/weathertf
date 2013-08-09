class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ForecastIO.api_key = '7ae01f0b413da3017237ae750145a642'

  

end
