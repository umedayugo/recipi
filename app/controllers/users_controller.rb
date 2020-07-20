class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@post = Post.where(params[:id])
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
