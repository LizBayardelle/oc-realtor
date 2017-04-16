class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :preferred_contact
      t.string :message
      t.boolean :buying
      t.boolean :selling

      t.timestamps null: false
    end
  end
end
