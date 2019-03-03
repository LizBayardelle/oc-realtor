class AddDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :first_name, :string
    change_column :users, :last_name, :string
    change_column :users, :busy, :boolean, default: false
    change_column :users, :stressed, :boolean, default: false
    change_column :users, :depressed, :boolean, default: false
    change_column :users, :anxious, :boolean, default: false
    change_column :users, :panicked, :boolean, default: false
    change_column :users, :lethargic, :boolean, default: false
    change_column :users, :worried, :boolean , default: false
    change_column :users, :indecisive, :boolean, default: false
    change_column :users, :other_feels, :boolean, default: false
    change_column :users, :opt_in, :boolean, default: false
  end
end
