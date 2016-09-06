class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@photos = @user.photos.order('created_at DESC')
		@photo = Photo.new
	end
end
