class AddPdfsToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :link_text, :string
    add_column :blogs, :link_filename, :string
  end
end
