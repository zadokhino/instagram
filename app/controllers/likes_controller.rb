class LikesController < ApplicationController
	def create
		@like = current_user.likes.build(photo_id: params[:photo_id])
		if @like.save
			flash[:notice] = "Liked"
			redirect_to photo_path(@like.photo.id)
		else
			flash[:error] = "Not liked"
			redirect_to root_path
		end
	end
end
