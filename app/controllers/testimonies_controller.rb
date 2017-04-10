class TestimoniesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  before_action :find_testimonies, only: [:show, :edit, :update, :destroy]
  
  def index
    @testimony = Testimony.all.order('created_at DESC')
  end

  def create
    @testimony = Testimony.new(testimonies_params)

		if @testimony.save
			redirect_to @testimony, notice: 'Testimony created'
		else
			render "New"
		end
  end
  
  def new
    @testimony = Testimony.new
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

	

	def find_testimony
		@testimony = Testimony.find(params[:id])
	end

end
