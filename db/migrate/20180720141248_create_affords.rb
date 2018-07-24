class CreateAffords < ActiveRecord::Migration[5.2]
  def change
    create_table :affords do |t|
      t.decimal :monthly, :precision => 11, :scale => 2
      t.decimal :insurance, :precision => 11, :scale => 2
      t.decimal :tax, :precision => 11, :scale => 2
      t.decimal :dues, :precision => 11, :scale => 2
      t.decimal :downpayment, :precision => 11, :scale => 2
      t.integer :term
      t.decimal :interest, :precision => 11, :scale => 2
      t.decimal :combined_tax, :precision => 11, :scale => 2
      t.string :email
      t.boolean :contact, default: false

      t.timestamps
    end
  end
end
