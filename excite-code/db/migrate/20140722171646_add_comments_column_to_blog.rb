class AddCommentsColumnToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :comments, :integer, null: false, default: 0
  end
end
