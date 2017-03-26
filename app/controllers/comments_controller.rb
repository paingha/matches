class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable, notice: "your comment was successful posted"
    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
