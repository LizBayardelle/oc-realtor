class AddSlugToPillar < ActiveRecord::Migration[5.2]
  def change
    add_column :pillars, :slug, :string
    add_index :pillars, :slug, unique: true
  end
end
