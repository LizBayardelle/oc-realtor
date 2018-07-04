class AddIndexToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :pillars, index: true, foreign_key: true
    change_column :pillars, :active, :boolean, default: false
    change_column :pillars, :menu, :boolean, default: false
  end
end
