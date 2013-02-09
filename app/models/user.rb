class User < ActiveRecord::Base
  set_primary_key :fbid
  attr_accessible :fbid, :username, :use_profile_pic
end
