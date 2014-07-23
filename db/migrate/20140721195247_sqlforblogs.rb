class Sqlforblogs < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :body, :string
    add_column :blogs, :keywords, :string    
  end
end
