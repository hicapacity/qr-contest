class CreateQrCodes < ActiveRecord::Migration
  def change
    create_table :qr_codes do |t|
      t.string :shortcode, :limit => 6, :null => false
      t.string :badge_image, :null => true
      t.timestamps
    end
  end
end
