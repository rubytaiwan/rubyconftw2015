class StaticPagesController < ApplicationController
  def home
  	@speakers = Speaker.all
  	@sponsors = Sponsor.all
  end
end
