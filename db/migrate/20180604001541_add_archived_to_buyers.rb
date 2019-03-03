class AddArchivedToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :archived, :boolean, default: false
  end
end
