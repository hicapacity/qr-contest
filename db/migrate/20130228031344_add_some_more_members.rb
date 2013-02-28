class AddSomeMoreMembers < ActiveRecord::Migration
  def up
    QRCode.find_by_shortcode('bf4am4rshc').update_attributes(:is_member => true)
    QRCode.find_by_shortcode('nbyyit8egj').update_attributes(:is_member => true)
  end

  def down
  end
end
