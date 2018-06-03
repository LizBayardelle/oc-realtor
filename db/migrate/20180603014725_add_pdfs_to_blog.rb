class AddPdfsToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :link_text, :string
    add_column :blogs, :link_filename, :string
  end
end
