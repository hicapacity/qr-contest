class QrcodeController < ApplicationController
  
  def show
    @code = QRCode.find_by_shortcode params[:shortcode]
    raise ActionController::RoutingError.new('Not Found') if @code.nil?
    
    @badge = @code.badge
    @logbadge = false
    if user_logged_in?
      current_user.qr_codes << @code unless current_user.qr_codes.exists? @code
      unless @badge.nil?() || current_user.badges.exists?(@badge)
        # TODO: @logbadge = true
        current_user.badges << @badge
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
