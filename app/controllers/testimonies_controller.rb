class TestimoniesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  
  def index
    @testimony = Testimony.all.order('created_at DESC')
  end

  def create
   @testimony = Testimony.new(params.require(:testimony).permit(:title, :text))
    @testimony.save
    redirect_to @testimony
  end
  
  def new
    
  end
  
  def update
    if @testimony.update(testimonies_params)
			redirect_to @testimony
		else
			render "Edit"
		end
  end
  
  def edit
  end
  
  def show
  end
  
  def destroy
    @testimony.destroy
	redirect_to root_path
  end
  
  def testimonies_params
		params.require(:testimony).permit(:title, :text)
	end

	def set_admin
		if current_user.admin == true

		else
			
			redirect_to root_path
		end
	end

	

	def find_testimony
		@testimony = Testimony.find(params[:id])
	end

end
