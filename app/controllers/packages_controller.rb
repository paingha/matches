class PackagesController < ApplicationController
  def index
  end
  
  def bronze
    u = current_user
    u.package = bronze
    u.save
    redirect_to packages_path
  end
end
