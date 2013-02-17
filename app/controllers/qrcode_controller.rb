class QrcodeController < ApplicationController
  
  def show
    @code = QRCode.find_by_shortcode params[:shortcode]
    raise ActionController::RoutingError.new('Not Found') if @code.nil?
    
    @badges = []
    if user_logged_in?
      unless @code.badge.nil?() || current_user.badges.exists?(@code.badge)
        current_user.badges << @code.badge
        @badges << @code.badge
      end
      
      unless current_user.qr_codes.exists? @code
        current_user.qr_codes << @code

        cnt = current_user.qr_codes.count
        if cnt % 5 == 0
          badge = Badge.find_by_slug "#{cnt}-qrcodes"
          unless badge.nil?() || current_user.badges.exists?(badge)
            current_user.badges << badge
            @badges << badge
          end
        end
      end
      
      current_user.save
    end
    
    begin
      render params[:shortcode]
    rescue ActionView::MissingTemplate
      render
    end
  end
  
end
