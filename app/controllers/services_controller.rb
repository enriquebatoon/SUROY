class ServicesController < ApplicationController

def new
	@serve = Service.new
end

def create
	@serve = Service.new(params[:service])
	@hot = Hotspot.find(params[:service][:id])

	if @serve.save
	@hot.services << @serve
	redirect_to hotspot_path(@hot.id), :notice => "You successfully added a service!"
	else
	render "new"
	end
end
def show
	@serve = Service.find(params[:id])	
	@hot = Hotspot.find(@serve.hotspot_id)
	com = Company.find(@hot.company_id)
    @memb = Member.find(com.member_id)
end

def edit
	@serve = Service.find(params[:id])
end

def update
	@serve = Service.find(params[:id])
	hot = @serve.hotspot_id;

	if @serve.update_attributes(params[:service])
  	redirect_to hotspot_path(hot), :notice => "You successfully edited a service!"
	else
  	render "edit"
	end
end
def destroy
	@serve = Service.find(params[:id])
	@hot = @serve.hotspot_id;
	@serve.destroy
	redirect_to hotspot_path(@hot)
end


end