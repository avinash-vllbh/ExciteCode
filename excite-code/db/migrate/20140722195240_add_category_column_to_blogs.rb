class AddCategoryColumnToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :category, :integer, null: false, default: 0
  end
end
