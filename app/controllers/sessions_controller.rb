class SessionsController < ApplicationController
	def new

	end
	def create
		member = Member.authenticate(params[:username], params[:password])
		if member
			session[:member_id] = member.id
			if member.user_type == 0
				redirect_to members_path, :notice => "Logged in!" #redirect to profile page!
			else
				redirect_to new_company_path, :notice => "Logged in!" #redirect to profile page!
			end
		else
			flash.now.alert = "Invalid username or password"
			render "new"
		end
	end
	def destroy
		session[:member_id] = nil
		redirect_to root_url
	end
end
