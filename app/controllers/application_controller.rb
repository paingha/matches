class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  def ensure_verified
    if session[:verified] == nil
      redirect_to new_verification_path
      else
      
    end
  end

  
end
