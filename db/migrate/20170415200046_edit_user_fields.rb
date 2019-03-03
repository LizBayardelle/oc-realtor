class EditUserFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :busy
    remove_column :users, :stressed
    remove_column :users, :depressed
    remove_column :users, :anxious
    remove_column :users, :panicked
    remove_column :users, :lethargic
    remove_column :users, :worried
    remove_column :users, :indecisive
    remove_column :users, :other_feels
    add_column :users, :phone, :string
    add_column :users, :wants, :string
  end
end
