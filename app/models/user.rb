class User < ActiveRecord::Base
  set_primary_key :fbid
  attr_accessible :fbid, :username, :use_profile_pic
  has_and_belongs_to_many :qr_codes, :join_table => :users_qr_codes, :class_name => 'QRCode'
  has_and_belongs_to_many :badges, :join_table => :users_badges
end
