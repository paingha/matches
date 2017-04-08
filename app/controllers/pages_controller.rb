class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  def index
  	@announcement = Announcement.all.where(published: 'true').order('created_at DESC')
  end
  
  
end
