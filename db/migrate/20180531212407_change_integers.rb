class ChangeIntegers < ActiveRecord::Migration[5.2]
  def change
    change_column :quicks, :bedrooms, :string
    change_column :quicks, :bathrooms, :string
  end
end
