module Api
  class LeaderboardController < ::ApplicationController
    
    def index
      render :json => {
        :timestamp => DateTime.now.iso8601,
        :users => User.all.map do |u|
          {
            :id => u.fbid,
            :name => u.username,
            :pic => "//graph.facebook.com/#{u.use_profile_pic ? u.fbid : 1}/picture",
            :codes => u.qr_codes.count,
            :stamp => (u.last_qrcode_found_at.nil?() ? 0 : u.last_qrcode_found_at.iso8601)
          }
        end
      }
    end
    
    def updates_since
      render :json => {
        :timestamp => DateTime.now.iso8601,
        :new_users => User.where('created_at > ?', params[:stamp]).map do |u|
          {
            :id => u.fbid,
            :name => u.username,
            :pic => "//graph.facebook.com/#{u.use_profile_pic ? u.fbid : 1}/picture",
            :codes => u.qr_codes.count,
            :stamp => (u.last_qrcode_found_at.nil?() ? 0 : u.last_qrcode_found_at.iso8601)
          }
        end,
        :updates => User.where('last_qrcode_found_at > ?', params[:stamp]).map do |u|
          {
            :id => u.fbid,
            :codes => u.qr_codes.count,
            :stamp => u.last_qrcode_found_at.iso8601
          }
        end
      }
    end
    
  end
end