class AddCategoryColumnToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :category_id, :integer, null: false, default: 0
  end
end
