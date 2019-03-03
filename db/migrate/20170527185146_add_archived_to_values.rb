class AddArchivedToValues < ActiveRecord::Migration[5.2]
  def change
    add_column :values, :archived, :boolean, default: false
  end
end
