class QrcodeController < ApplicationController
  
  def show
    @code = QRCode.find_by_shortcode params[:shortcode]
    raise ActionController::RoutingError.new('Not Found') if @code.nil?
    
    @badge = @code.badge
    begin
      render params[:shortcode]
    rescue ActionView::MissingTemplate
      render
    end
  end
  
end
