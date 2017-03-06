class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user!, unless: :devise_controller?
 
def verify_user!
  start_verification if requires_verification?
end
  
  def requires_verification?
  session[:verified].nil? && !current_user.phone.blank?
end
  
  def start_verification
  result = Nexmo::Client.new.send_verification_request(
    number: current_user.phone,
    brand: "PayBox",
    sender_id: 'PayBox'
  )
  if result['status'] == '0'
    redirect_to edit_verification_path(id: result['request_id'])
  else
    sign_out current_user
    redirect_to :new_user_session, flash: {
      error: 'Could not verify your number. Please contact support.'
    }
  end
end
end
