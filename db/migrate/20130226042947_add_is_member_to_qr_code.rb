class AddIsMemberToQrCode < ActiveRecord::Migration
  def change
    add_column :qr_codes, :is_member, :boolean, :null => false, :default => false
  end
end
