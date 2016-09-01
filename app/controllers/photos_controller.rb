class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = current_user.photos.build(photo_params)
		if @photo.save
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
			redirect_to photos_path
		else
			render 'edit'
		end
	end

	def destroy
		@photo = Photo.destroy(params[:id])
		redirect_to user_path(current_user)
	end
	private
	def photo_params
		params.require(:photo).permit(:description, :text)
	end


end
