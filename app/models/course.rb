class Course < ActiveRecord::Base
	# Initalize the uploader
	mount_uploader :image, ImageUploader
end
