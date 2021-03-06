class PostCommentsController < ApplicationController

	def create
		post =Post.find(params[:post_id])
		comment = PostComment.new(post_comment_params)
		comment.post_id = post.id
		comment.user_id = current_user.id
		comment.save
		redirect_to post_path(post)
	end

	def destroy
		post = Post.find(params[:poat_id])
		favorite = current_user.favorites.find_by(post_id: post.id)
		favorite.destroy
		redirect_to post_path(post)
	end

	private
	def post_comment_params
	    params.require(:post_comment).permit(:comment)
	end
end
