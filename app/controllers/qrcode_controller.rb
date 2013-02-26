class QrcodeController < ApplicationController
  
  def show
    @code = QRCode.find_by_shortcode params[:shortcode]
    raise ActionController::RoutingError.new('Not Found') if @code.nil?
    
    @badges = []
    total_qr_codes = QRCode.count
    found_codes = 0
    if user_logged_in?
      unless @code.badge.nil?() || current_user.badges.exists?(@code.badge)
        current_user.badges << @code.badge
        @badges << @code.badge
      end
      
      unless current_user.qr_codes.exists? @code
        current_user.qr_codes << @code
        current_user.last_qrcode_found_at = DateTime.now
        
        cnt = current_user.qr_codes.where(:is_member => true).count
        if cnt % 3 == 0
          badge = Badge.find_by_slug "#{cnt}-members"
          unless badge.nil?() || current_user.badges.exists?(badge)
            current_user.badges << badge
            @badges << badge
          end
        end

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
      found_codes = current_user.qr_codes.count
    end
    
    if found_codes == total_qr_codes
      @inspirational_msg = "You've found all of the QR Codes!"
    else
      fifths = total_qr_codes / 5
      case rand found_codes
      when 0...fifths
        @inspirational_msg = "Keep looking! There are more to find!"
      when fifths...(2 * fifths)
        @inspirational_msg = "Hey, you're pretty good at this!"
      when (2 * fifths)...(3 * fifths)
        @inspirational_msg = "Now we're cooking with gas!"
      when (3 * fifths)...(4 * fifths)
        @inspirational_msg = "One more down; only a few more to go!"
      else
        @inspirational_msg = "Keep going! You've almost found them all!"
      end
    end
    
    begin
      render 'qrcode/codes/' + params[:shortcode]
    rescue ActionView::MissingTemplate
      render
    end
  end
  
end
