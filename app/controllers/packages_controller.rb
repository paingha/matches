class PackagesController < ApplicationController
  def index
  end
  
  def bronze_package
    u = current_user
    u.package = "bronze"
    u.save
  end
end
