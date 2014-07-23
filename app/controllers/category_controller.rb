class CategoryController < ApplicationController
  def index
    @categories = Categories.all
  end
  def new
    @category = Categories.new
  end
  def create
    @category = Categories.new(category_params)
    @category.save
    redirect_to blog_index_path
  end
  def show

  end
  def edit

  end
  def destroy

  end

  private
  def category_params
    params.require(:categories).permit(:name)
  end
end