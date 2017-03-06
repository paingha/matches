class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  def ensure_verified
    unless verified?
      redirect_to new_verification_path
    end
  end

  def verified?
    if !session[:verified].nil?
  end
end
