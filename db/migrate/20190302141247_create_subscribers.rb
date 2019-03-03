class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :last_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :tags, default: [], array: true
      t.text :admin_notes
      t.boolean :unsubscribe

      t.timestamps
    end
  end
end
