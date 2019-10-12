class AddWhatIsItToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :whatisit, :string
  end
end
