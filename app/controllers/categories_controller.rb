class CategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    @category.slug = @category.name.downcase.gsub(" ", "-")
    if @category.save
      redirect_to blog_index_path
    else
      flash[:alert] = "Invalid name for category"
      redirect_to new_category_path
    end
  end
  def show
    category = Category.find_by(slug: params[:slug])
    @blogs = Blog.where(category_id: category.id).paginate(:page => params[:page], :per_page => 5).order('id DESC').includes(:comments)
    @categories = Category.all
  end
  def edit
    
  end

  # Don't want to destroy anything
  # def destroy

  # end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end