class StaticPagesController < ApplicationController
  def home
  	@speakers = Speaker.order(:sort_order).all
  	@sponsors = Sponsor.order("level, name").all
    @nav_sections = %w{home speaker schedule venue coc sponsor}
  end
end
