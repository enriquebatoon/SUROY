class CompaniesController < ApplicationController
	helper_method :sort_column, :sort_direction
def index
	@com = current_user.companies.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
end
def sort_column
  	Company.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
def show
	@com = Company.find(params[:id])
end
def new
	@com = Company.new
end
def create
	@com = Company.new(params[:company])

if @com.save
	current_user.companies << @com
	
	redirect_to companies_path, :notice => "You have successfully added a company!"
else
	render "new"
end
end
def edit
	@com = Company.find(params[:id])
end

def update
@com = Company.find(params[:id])

if @com.update_attributes(params[:company])
  redirect_to company_path(@com)
else
  render "edit"
end
end
def destroy
	@com = Company.find(params[:id])
	@com.destroy
	redirect_to companies_path
end



end
