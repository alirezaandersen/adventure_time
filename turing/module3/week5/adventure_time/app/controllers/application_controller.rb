class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :geo_location
  respond_to :json, :html
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def geo_location
    Rails.cache.fetch("geo-location", expires_in: 5.minutes) do
      UndergroundWeather.geo_by_location
    end
  end

end
