class AddPrimaryCategoryToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :primary_category, :string
  end
end
