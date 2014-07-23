class BlogController < ApplicationController
  def index
    @blogs = Blog.paginate(:page => params[:page], :per_page => 5)
    # raise
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(article_params)
    @blog.save
    redirect_to @blog
  end
  def show
    @blog = Blog.find(params[:id])
  end

  private
  def article_params
    params.require(:blog).permit(:title, :body, :keywords)
  end
end
