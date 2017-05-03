class AddAttachmentDefaultImageToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :default_image
    end
  end

  def self.down
    remove_attachment :listings, :default_image
  end
end
