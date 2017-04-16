class AddAddressToListings < ActiveRecord::Migration
  def change
    add_column :listings, :address, :string
    add_column :listings, :citystatezip, :string
  end
end
