class RegistrationsController < Devise::RegistrationsController
 

  
  
  private
   
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :avatar, :account_name, :account_number, :account_description, :address)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :phone, :avatar, :address)
  end
  
end