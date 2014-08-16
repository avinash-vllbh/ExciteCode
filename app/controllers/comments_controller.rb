class CommentsController < ApplicationController
  load_and_authorize_resource
  def index
    begin
      @blog = Blog.find_by(slug: params[:blog_id])
      redirect_to blog_path(@blog)
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "I don't have that. Are you sure?"
      redirect_to blog_index_path
    end
  end
  def create
    @blog = Blog.find_by(slug: params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end
  def destroy
    @blog = Blog.find_by(slug: params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body, :posted_by)
    end
end
