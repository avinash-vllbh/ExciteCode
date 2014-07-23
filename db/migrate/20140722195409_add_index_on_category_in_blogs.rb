class AddIndexOnCategoryInBlogs < ActiveRecord::Migration
  def change
    add_index :blogs, :category
  end
end
