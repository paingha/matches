 
  class VerificationsController < ApplicationController
  before_action :verify_user

  def new
  end

  def create
    response = client.check_verification(
      session[:verification_id],
      code: params[:code]
    )

    if response['status'] == '0'
      redirect_to root_path(id: response['verification_id'])
      
    else
      flash[:alert] = 'Code invalid'
      redirect_to [:new, :verification]
    end
  end

  private
    
    def verify_user
      if session[:verification_id].nil? && !current_user.phone_number.blank?
        send_verification_request
        else
        redirect_to root_path
      end
    end
    
    

  def send_verification_request
    response = client.start_verification(
      number: current_user.phone,
      brand: 'PayBox'
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
