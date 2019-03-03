class AddReadToEverything < ActiveRecord::Migration[5.2]
  def change
    add_column :quicks, :read, :boolean, default: false
    add_column :buyers, :read, :boolean, default: false
    add_column :comments, :read, :boolean, default: false
    add_column :contacts, :read, :boolean, default: false
    add_column :users, :read, :boolean, default: false
    add_column :values, :read, :boolean, default: false
    add_column :comments, :email, :string
    add_column :comments, :name, :string
    add_column :values, :email, :string
  end
end
