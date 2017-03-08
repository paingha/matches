class AnnouncementsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_announcement, only: [:show, :edit, :update, :destroy]
  before_action :ensure_verified
  
  def index
    @announcement = Announcements.all.order('created_at DESC')
  end
  
  def create
    @announcement = Announcement.new(announcements_params)

		if @announcement.save
			redirect_to @announcement, notice: 'Announcement created'
		else
			render "New"
		end
  end
  
  def new
    @announcement = Announcement.new
  end
  
  def update
    if @announcement.update(announcements_params)
			redirect_to @announcement
		else
			render "Edit"
		end
  end
  
  def edit
  end
  
  def show
  end
  
  def destroy
    @announcement.destroy
		redirect_to root_path
  end
  
  def announcements_params
		params.require(:announcement).permit(:text, :published)
	end

	def set_admin
		if current_user.admin == true

		else
			
			redirect_to root_path
		end
	end

	

	def find_announcement
		@announcement = Announcement.find(params[:id])
	end
end
