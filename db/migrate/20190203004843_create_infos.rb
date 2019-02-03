class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :goal
      t.string :residence_type
      t.string :residence_use
      t.string :timeframe
      t.string :first_time
      t.string :military
      t.string :agent
      t.integer :purchase_price
      t.integer :downpayment
      t.integer :credit_score
      t.integer :late_payments
      t.string :foreclosures
      t.string :bankruptcy
      t.boolean :read, default: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
