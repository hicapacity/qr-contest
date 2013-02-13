class RemoveBadgeImageFromQrCodes < ActiveRecord::Migration
  def up
    remove_column :qr_codes, :badge_image
  end

  def down
    add_column :qr_codes, :badge_image, :string, :null => true
  end
end
