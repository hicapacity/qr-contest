class AddQrCodeIdToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :qr_code_id, :integer, :null => true
    add_index :badges, :qr_code_id
  end
end
