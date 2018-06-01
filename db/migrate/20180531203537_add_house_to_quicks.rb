class AddHouseToQuicks < ActiveRecord::Migration
  def change
    add_column :quicks, :house, :boolean, default: true
  end
end
