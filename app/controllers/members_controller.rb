class MembersController < ApplicationController
	  def show
		  @mem = Member.find(params[:id])
      @hot = Hotspot.search(params[:search]).page(params[:page]).per(3)
      @com = Company.find_by_member_id(@mem)
	  end

	  def new
   		@reg = Member.new
      @usertype = params[:type]
  	end

  	def create
  		@reg = Member.new(params[:member])

  		if @reg.save
  			redirect_to new_session_path, :notice => "You have successfully signed up!";
  		else
  			render "new"
  		end
  	end

  	def index
      @hot = Hotspot.page(params[:page]).per(4);
      
  	end

  	def edit
  		@mem = Member.find(params[:id]);
  	end

    def update
    @mem = Member.find(params[:id])

      if @mem.update_attributes(params[:member])
        redirect_to member_path(@mem)
      else
        render "edit"
      end
    end
end