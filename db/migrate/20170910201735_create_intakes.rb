class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :current_own, default: false
      t.boolean :current_rent, default: false
      t.decimal :current_monthly_pay, :precision => 11, :scale => 2
      t.string :looking_for
      t.string :areas
      t.string :amenities
      t.string :price_range
      t.integer :bedrooms
      t.string :reason
      t.string :looking_time
      t.boolean :other_agent, default: false
      t.string :other_agent_name
      t.boolean :seen_liked, default: false
      t.string :seen_no_buy
      t.string :when_moved
      t.string :best_times
      t.decimal :price_min, :precision => 11, :scale => 2
      t.decimal :price_max, :precision => 11, :scale => 2
      t.string :buying_with
      t.decimal :downpayment, :precision => 11, :scale => 2
      t.string :source
      t.string :budget_monthly
      t.boolean :met_lender, default: false
      t.boolean :preapproved, default: false
      t.decimal :preapproved_amount, :precision => 11, :scale => 2

      t.timestamps null: false
    end
  end
end
