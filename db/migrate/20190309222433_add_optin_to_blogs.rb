class AddOptinToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :optin, :boolean, default: false
    add_column :blogs, :optin_tags, :string, default: "LM-blog"
  end
end
