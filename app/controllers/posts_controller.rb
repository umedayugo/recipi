class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all.order(created_at: :desc)
		@users = User.all.order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
		@post.user#postのデータに紐づくuserのデータを取ってくる
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

	def search
	    if params[:recipe_name].present?
	      @posts = Post.where('recipe_name LIKE ?', "%#{params[:recipe_name]}%")
	    else
	      @posts = Post.none
	    end
    end

	private
	def post_params
		params.require(:post).permit(:recipe_name, :image, :caption)
	end

end
