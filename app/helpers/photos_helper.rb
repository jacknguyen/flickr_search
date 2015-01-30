module PhotosHelper
	def find_photoset_id_by_user_url(url)
		user = flickr.urls.lookupUser( url: url )
		random_photoset = flickr.photosets.getList(user_id: user.id).to_a.sample.id	# an array of objects of photo albums, each albums may contain many photos
	end

	def photos_in_set(photo_set_id)
		flickr.photosets.getPhotos( photoset_id: photo_set_id ).photo.map { |image| image.id  }	# an array of photo id
	end

	def photo_url(photo_id)
		photo = flickr.photos.getInfo(photo_id: photo_id)
		FlickRaw.url_b(photo)
	end
end
