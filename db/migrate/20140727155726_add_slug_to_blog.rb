class AddSlugToBlog < ActiveRecord::Migration
  def change
  	add_column :blogs, :slug, :string, null: false, unique: true
  	add_index :blogs, :slug
  end
end
