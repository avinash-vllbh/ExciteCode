class BlogController < ApplicationController
  def index
    # Check with ryan on the ambiguos colon issue
    # @blogs = Blog.paginate(:page => params[:page], :per_page => 5).order('id DESC').eager_load(:category)
    @blogs = Blog.paginate(:page => params[:page], :per_page => 5).order('id DESC').includes(:comments)
    @categories = Category.all
  end
  def new
    @blog = Blog.new
    @categories = Category.all.pluck(:name, :id)
  end
  def create
    @blog = Blog.new(article_params)
    if @blog.save
      redirect_to @blog
    else 
      flash[:alert] = "Failed to save the blog"
      redirect_to new_blog_path
    end
  end
  def show
    @blog = Blog.find(params[:id])
    # @blog.comments
    # raise
  end

  private
  def article_params
    params.require(:blog).permit(:title, :body, :keywords, :category_id)
  end
end
