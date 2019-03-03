class AddHouseToQuicks < ActiveRecord::Migration[5.2]
  def change
    add_column :quicks, :house, :boolean, default: true
  end
end
