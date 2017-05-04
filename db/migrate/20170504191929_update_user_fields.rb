class UpdateUserFields < ActiveRecord::Migration
  def change
    add_column :users, :buyer, :boolean, default:false
    add_column :users, :seller, :boolean, default:false
    add_column :users, :blog_emails, :boolean, default:false
    add_column :users, :preferred_contact, :string
    remove_column :users, :wants
    remove_column :users, :opt_in
  end
end
