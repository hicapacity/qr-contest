class BadgesController < ApplicationController
  layout "public"
  
  def show
    @badge = Badge.find_by_slug params[:id]
  end
  
end
