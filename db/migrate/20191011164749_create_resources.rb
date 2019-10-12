class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.boolean :general, default: false
      t.boolean :buying, default: false
      t.boolean :selling, default: false
      t.boolean :loan, default: false
      t.boolean :refinance, default: false
      t.boolean :investing, default: false
      t.string :resource_type
      t.string :link_url
      t.boolean :active, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
