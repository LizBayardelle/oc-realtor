class AddIndexToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :pillars, index: true
    change_column :pillars, :active, :boolean, default: false
    change_column :pillars, :menu, :boolean, default: false
  end
end
