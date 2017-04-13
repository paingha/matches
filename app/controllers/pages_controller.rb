class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  def index
  	@announcement = Announcement.where(published: 'true').order('created_at DESC')
    @match = Match.where(receiver_id: current_user.id)
  end
  
  
end
