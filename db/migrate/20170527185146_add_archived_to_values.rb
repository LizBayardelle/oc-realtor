class AddArchivedToValues < ActiveRecord::Migration
  def change
    add_column :values, :archived, :boolean, default: false
  end
end
