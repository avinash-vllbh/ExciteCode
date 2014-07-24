class CommentsController < ApplicationController
  def index
    begin
      @blog = Blog.find(params[:blog_id])
      redirect_to blog_path(@blog)
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "I don't have that. Are you sure?"
      redirect_to blog_index_path
    end
  end
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body, :posted_by)
    end
end
