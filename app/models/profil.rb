class Profil < ActiveRecord::Base
		mount_uploader :image, ImageUploader
end
