class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  def ensure_verified
    if current_user.verified = true
      
      else
      redirect_to new_verification_path
    end
  end

  
end
