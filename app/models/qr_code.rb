class QRCode < ActiveRecord::Base
  attr_accessible :shortcode, :is_member
  has_one :badge
  has_and_belongs_to_many :users, :join_table => :users_qr_codes
end
