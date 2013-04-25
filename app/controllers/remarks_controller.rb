class RemarksController < ApplicationController
	def new
	@rem = Remark.new
end

def create
	@rem = Remark.new(params[:remark])
	@hot = Hotspot.find(params[:remark][:hotspot_id])
	

	if @rem.save
	@hot.remarks << @rem
	current_user.remarks << @rem

	redirect_to hotspot_path(@hot.id)
	else
	render "new"
	end
end

def destroy
	@rem = Remark.find(params[:id])
	@hot = @rem.hotspot_id
	@rem.destroy
	redirect_to hotspot_path(@hot)
end
end
