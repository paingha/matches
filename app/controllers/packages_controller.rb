class PackagesController < ApplicationController
  def index
  	@meta_title = meta_title 'Packages'
    @meta_description = 'Membership contribution packages'
  end
  
  def bronze
    u = current_user
      u.package = bronze
      u.save!
      redirect_to :root
  end
end
