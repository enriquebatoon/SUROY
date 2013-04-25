class HotspotsController < ApplicationController
helper_method :sort_column, :sort_direction, :rate
def rate
    @hot = Hotspot.find(params[:id])
    @hot.rate(params[:stars], current_user)
    render :update do |page|
      page.replace_html @hot.wrapper_dom_id(params), ratings_for(@hot, params.merge(:wrap => false))
      page.visual_effect :highlight, @hot.wrapper_dom_id(params)
	end
	redirect_to @hot
end
def index
	@hot = Hotspot.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
end
  def sort_column
  	Hotspot.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
def new
	@hot = Hotspot.new
end
def show
	@hot = Hotspot.find(params[:id])
	com = Company.find(@hot.company_id)
    @memb = Member.find(com.member_id)
end
def create

	@hot = Hotspot.new(params[:hotspot])
	@com = Company.find(params[:hotspot][:id])

if @hot.save
	@com.hotspots << @hot
	redirect_to @hot, :notice => "You successfully added a hotspot!"
else
	render "new"
end
end
def edit
	@hot = Hotspot.find(params[:id])
end
def update
@hot = Hotspot.find(params[:id])

if @hot.update_attributes(params[:hotspot])
  redirect_to hotspot_path(@hot), :notice => "You successfully edited a hotspot!"
else
  render "edit"
end
end
def destroy
	@hot = Hotspot.find(params[:id])
	@com = @hot.company_id
	@hot.destroy
	redirect_to company_path(@com)
end
end