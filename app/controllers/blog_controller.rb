class BlogController < ApplicationController
  
    
    def index
    @blog = Blog.all.order('created_at DESC')
    @meta_title = meta_title 'Paybox Blog'
    @meta_description = 'Comprehensive tutorials and hacks on how to use Paybox effectively'
    end
    
    def show
    @blog = Blog.find(params[:id])
    @meta_title = meta_title @blog.title
    @meta_description = @blog.meta_description
    end
  
    def new
    end
  
    def create
     
    @blog = Blog.new(params.require(:blog).permit(:title, :body, :meta_description))
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
