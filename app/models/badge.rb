class Badge < ActiveRecord::Base
  attr_accessible :slug, :title, :description, :rank, :qr_code_id
  belongs_to :qr_code
  has_and_belongs_to_many :users, :join_table => :users_badges
end
