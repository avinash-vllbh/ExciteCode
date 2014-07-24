class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
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
    params.require(:category).permit(:name)
  end
end