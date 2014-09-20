class BlogController < ApplicationController
  # authorize_resource
  load_and_authorize_resource :find_by => :slug
  
  def index
    @blogs = Blog.paginate(:page => params[:page], :per_page => 5).order('id DESC').includes(:comments)
    @categories = Category.all
    # Respond to - HTML & JSON
    respond_to do |format|
      format.html 
      format.json {render json: @blogs}
    end
  end
  def new
    @blog = Blog.new
    @categories = Category.all.pluck(:name, :id)
  end
  def create
    @blog = Blog.new(article_params)
    @blog.slug = @blog.title.downcase.gsub(" ", "-")
    if @blog.save
      redirect_to @blog
    else 
      flash[:alert] = "Failed to save the blog"
      redirect_to new_blog_path
    end
  end
  def show
    @blog = Blog.find_by(slug: params[:id])
    # Respond to - HTML & JSON
    respond_to do |format|
      format.html 
      format.json {render json: @blogs}
    end
  end

  private
  def article_params
    params.require(:blog).permit(:title, :body, :keywords, :category_id, :slug)
  end
end
