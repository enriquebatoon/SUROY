class RatingsController < ApplicationController
	def new
		@rate = Rating.new
	end
	def create
		@rate = Rating.new(params[:rating])
		@hot = Hotspot.find(params[:rating][:hotspot_id])
		

		if @rate.save
		@hot.ratings << @rate
		current_user.rating << @rem
		end
		redirect_to hotspot_path(@hot.id)	
	end
end
