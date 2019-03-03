class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :busy, :boolean
    add_column :users, :stressed, :boolean
    add_column :users, :depressed, :boolean
    add_column :users, :anxious, :boolean
    add_column :users, :panicked, :boolean
    add_column :users, :lethargic, :boolean
    add_column :users, :worried, :boolean
    add_column :users, :indecisive, :boolean
    add_column :users, :other_feels, :boolean
    add_column :users, :opt_in, :boolean
  end
end
