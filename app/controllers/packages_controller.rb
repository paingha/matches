class PackagesController < ApplicationController
  def index
  end
  
  def bronze
    current_user.package = bronze
    redirect_to packages_path
  end
end
