class AddTagStringToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :tag_string, :string
  end
end
