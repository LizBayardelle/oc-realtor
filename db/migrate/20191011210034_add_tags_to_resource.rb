class AddTagsToResource < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :csv_tags, :string
  end
end