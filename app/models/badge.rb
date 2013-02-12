class Badge < ActiveRecord::Base
  attr_accessible :slug
  has_and_belongs_to_many :users, :join_table => :users_badges
end
