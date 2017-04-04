class BlogController < ApplicationController
  before_action :set_admin, only: [:new, :create, :edit, :update, :destroy]
    
    def index
    @blog = Blog.all.order('created_at DESC')
    end
    
    def show
    @blog = Blog.find(params[:id])
    end
    def new
    end
    def create
     
    @blog = Blog.new(params.require(:blog).permit(:title, :body))
    @blog.save
    redirect_to @blog
    
  
    end
    def edit
     @blog = Blog.find(params[:id])
    end
     
     
    def update
    @blog = Blog.find(params[:id])
  permitted_columns = params.require(:blog).permit(:title, :body)
  @blog.update_attributes(permitted_columns)

  redirect_to @blog
    end
  def destroy
  @blog = Blog.find(params[:id])
  @blog.destroy

  redirect_to blog_index_path, notice: "Successfully Deleted"
  end
  
  private

  def set_admin
    if current_user.admin == true

    else
      
      redirect_to root_path
    end
  end

  
    
end
