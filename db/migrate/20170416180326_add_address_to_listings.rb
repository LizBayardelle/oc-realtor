class AddAddressToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :address, :string
    add_column :listings, :citystatezip, :string
  end
end
