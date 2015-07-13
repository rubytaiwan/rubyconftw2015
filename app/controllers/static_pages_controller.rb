class StaticPagesController < ApplicationController
  def home
  	@speakers = Speaker.order(:sort_order).all
  	@sponsors_hash = Sponsor.all.to_a.group_by{|s| s.level}
    @nav_sections = %w{home speaker schedule venue coc sponsor}
  end
end
