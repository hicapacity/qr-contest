class AddFacebookAndTwitterBadges < ActiveRecord::Migration
  def up
    code = QRCode.create :shortcode => 'jdivhtimzi'
    Badge.create :slug => 'facebook', :title => 'Facebook Early Bird', :qr_code_id => code.id, :description => 'This badge was given to early participants who follow HI Capacity on Facebook.'

    code = QRCode.create :shortcode => '4b8rxh6w7c'
    Badge.create :slug => 'twitter', :title => 'Twitter Early Bird', :qr_code_id => code.id, :description => 'This badge was given to early participants who follow HI Capacity on Twitter.'
  end

  def down
  end
end
