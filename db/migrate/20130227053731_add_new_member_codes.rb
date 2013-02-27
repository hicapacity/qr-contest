class AddNewMemberCodes < ActiveRecord::Migration
  def up
    QRCode.find_by_shortcode('3qn8s7hy0a').update_attributes(:is_member => true)
    QRCode.find_by_shortcode('r6wg4i54g6').update_attributes(:is_member => true)
  end

  def down
  end
end
