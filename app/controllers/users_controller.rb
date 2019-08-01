class UsersController < ApplicationController
	def show
	  if user_signed_in?
	  	@user = User.find(params[:id])
	  else
	  	redirect_to root_path, notice: '使用者未登入'
	  end
	end
end
