class UsersQrCodes < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :qr_code
end
