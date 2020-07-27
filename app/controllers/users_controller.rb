class UsersController < ApplicationController

	def top
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end


	private
	def user_params
		params.require(:user).permit(:profile_image, :name, :userinfo)
	end
end
