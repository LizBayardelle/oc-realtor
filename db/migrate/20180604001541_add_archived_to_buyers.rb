class AddArchivedToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :archived, :boolean, default: false
  end
end
