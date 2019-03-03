class AddConfirmedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status_confirmed, :boolean, default: false
  end
end
