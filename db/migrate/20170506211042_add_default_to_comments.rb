class AddDefaultToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :approved, :boolean, default: false
  end
end
