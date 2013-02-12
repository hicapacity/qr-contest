class CreateUsersQrCodes < ActiveRecord::Migration
  def change
    create_table :users_qr_codes, :id => false do |t|
      t.references :user, :null => false
      t.references :qr_code, :null => false
    end
    
    add_index :users_qr_codes, :user_id
  end
end
