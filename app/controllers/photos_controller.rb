class PhotosController < ApplicationController
	include PhotosHelper

	def index
		if params[:url]
			url = params[:url]
			photoset_id = find_photoset_id_by_user_url( url )
			@photo_ids = photos_in_set(photoset_id)
			@photo = photo_url(@photo_ids.sample)
		end
	end

	private

		def search_params
			params.require(:url).permit(:url)
		end
end
