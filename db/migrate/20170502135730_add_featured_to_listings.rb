class AddFeaturedToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :featured, :boolean, default: false
  end
end
