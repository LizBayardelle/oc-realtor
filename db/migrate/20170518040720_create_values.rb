class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.string :address
      t.string :citystatezip
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
