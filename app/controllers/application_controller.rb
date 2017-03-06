class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  def ensure_verified
    unless verified?
      redirect_to new_verification_path
    end
  end

  def verified?
    session[:verified]
  end
end
