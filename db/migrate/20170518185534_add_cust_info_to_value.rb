class AddCustInfoToValue < ActiveRecord::Migration[5.2]
  def change
    add_column :values, :sell_timeframe, :string
  end
end
