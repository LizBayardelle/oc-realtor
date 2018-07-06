class CreatePillars < ActiveRecord::Migration[5.2]
  def change
    create_table :pillars do |t|
      t.string :name
      t.boolean :buyer
      t.boolean :seller
      t.boolean :active
      t.boolean :menu
      t.string :snippet
      t.text :description

      t.timestamps null: false
    end
  end
end
