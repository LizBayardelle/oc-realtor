class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :zpid
      t.string :status
      t.string :location

      t.timestamps null: false
    end
  end
end
