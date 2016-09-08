class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			flash[:notice] = "Added comment"
			redirect_to root_path
		else
			flash[:error] = "Not added"
			redirect_to root_path
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:text, :photo_id)
	end
end
