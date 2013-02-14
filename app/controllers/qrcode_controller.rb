class QrcodeController < ApplicationController
  
  def show
    @code = QRCode.find_by_shortcode params[:shortcode]
    raise ActionController::RoutingError.new('Not Found') if @code.nil?
    
    @badge = @code.badge
    if user_logged_in?
      user.qr_codes << @code
      user.badges << @badge unless @badge.nil?
      user.save
    end
    
    begin
      render params[:shortcode]
    rescue ActionView::MissingTemplate
      render
    end
  end
  
end
