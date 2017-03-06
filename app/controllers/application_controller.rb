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
    response = client.start_verification(
      number: current_user.phone,
      brand: 'MyApp'
    )

    if response['status'] == '0'
      session[:verification_id] =
        response['request_id']
    end
  end

  def client
    @client ||= Nexmo::Client.new(
      key: ENV['NEXMO_API_KEY'],
      secret: ENV['NEXMO_API_SECRET']
    )
  end
    
  
end
end
