class CreateQuicks < ActiveRecord::Migration
  def change
    create_table :quicks do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :range
      t.string :budget
      t.string :location
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :footage
      t.text :notes
      t.boolean :responded, default: false
      t.boolean :archived, default: false

      t.timestamps null: false
    end
  end
end
