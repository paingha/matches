class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  def ensure_verified
    if current_user.verified != true
      redirect_to new_verification_path
      else
      
    end
  end

  
end
