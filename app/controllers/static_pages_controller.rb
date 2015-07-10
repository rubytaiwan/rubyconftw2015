class StaticPagesController < ApplicationController
  def home
  	@speakers = Speaker.order(:sort_order).all
  	@sponsors = Sponsor.order("level, name").all
  end
end
