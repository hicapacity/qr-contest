class AddAnotherMember < ActiveRecord::Migration
  def up
    QRCode.find_by_shortcode('lmapoqg1wg').update_attributes(:is_member => true)
  end

  def down
  end
end
