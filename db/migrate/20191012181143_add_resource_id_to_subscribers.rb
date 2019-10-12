class AddResourceIdToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :resource_id_array, :string, default: [], array: true
  end
end
