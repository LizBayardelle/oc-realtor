class AddCustInfoToValue < ActiveRecord::Migration
  def change
    add_column :values, :sell_timeframe, :string
  end
end
