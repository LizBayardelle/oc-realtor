class ChangeContactForm < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :buying
    remove_column :contacts, :selling
    add_column :contacts, :purpose, :string
  end
end
