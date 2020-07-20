class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
		@users = User.all
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params)
		redirect_to user_path(current_user.id)
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to posts_path(@post.id)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(current_user.id)
	end

	private
	def post_params
		params.require(:post).permit(:recipe_name, :image, :caption)
	end

end
