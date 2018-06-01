class ChangeIntegers < ActiveRecord::Migration
  def change
    change_column :quicks, :bedrooms, :string
    change_column :quicks, :bathrooms, :string
  end
end
