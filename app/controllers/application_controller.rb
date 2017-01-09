class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_room 
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end
  
  helper_method :current_room
  
end
