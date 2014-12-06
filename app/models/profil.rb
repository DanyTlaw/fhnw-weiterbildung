class Profil < ActiveRecord::Base
		# Initalize uploader for profile
		mount_uploader :image, ImageUploader
end
