class AddLastQrCodeFoundAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_qrcode_found_at, :datetime, :null => true
  end
end
