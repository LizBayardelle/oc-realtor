class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :buyer_name
      t.string :phone_mobile
      t.string :phone_home
      t.string :phone_work
      t.string :phone_fax
      t.string :email
      t.string :employer
      t.string :search_time
      t.string :other_agent
      t.string :address
      t.string :family_size
      t.string :own_or_rent
      t.string :current_mortgage
      t.string :need_sell
      t.string :lease_length
      t.string :really_liked
      t.string :why_not
      t.string :move_time
      t.string :why_move_time
      t.string :price_range
      t.string :qualified
      t.string :lender
      t.string :downpayment
      t.string :monthly_budget
      t.string :bedrooms
      t.string :square_feet
      t.string :units
      t.string :location
      t.string :style
      t.string :decision
      t.string :helper
      t.string :requirements
      t.string :use_as_agent
      t.string :times
      t.string :communication
      t.string :best_time
      t.string :sites
      t.string :other_information

      t.timestamps null: false
    end
  end
end
