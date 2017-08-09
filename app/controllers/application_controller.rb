class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  BRAND_NAME = 'Paybox'.freeze

  def meta_title(title)
  	[title, BRAND_NAME].reject(&:empty?).join(' | ')
  end
  
  def is_receiver?
    if receiver_id == current_user.id
    end
  end

  def is_giver?
    if giver_id == current_user.id 
    end
  end

  helper_method :is_receiver?
  helper_method :is_giver?

  private
  def ensure_verified
    if current_user.verified != true
      redirect_to new_verification_path
      else
      
    end
  end

  
end
