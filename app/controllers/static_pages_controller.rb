class StaticPagesController < ApplicationController
  def home
  	@speakers = Speaker.all
  end
end
