class PagesController < ApplicationController
  def index
  	@reg = Member.new
  	@hot = Hotspot.order("created_at desc").limit(4)
  end
end
