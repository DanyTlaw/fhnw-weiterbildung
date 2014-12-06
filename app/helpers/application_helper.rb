module ApplicationHelper
	def randomAds
		# Set path to image folder and get all ids
		@fname = "#{Rails.root}/public/uploads/profil/image"
		@ads = Pathname.new(@fname).children.select { |c| c.directory? }

		# If no ids are present skip
		if !@ads.blank?
			# Randomize
			@ads.shuffle!
		end

		return @ads
	end

	def getImageAd(folder)

		# Search all the images for ads spaces
		@adsArray = Array.new
		@counter = 0

		if folder.blank?
			@adsArray[0] = "placeholder"
			@adsArray[1] = "placeholder"
			@adsArray[2] = "placeholder"
			@adsArray[3] = "placeholder"
			@adsArray[4] = "placeholder"
		else
			# Set pictures and only take the thumbversion of them
			@success = 0

			# 8 times because 8 ad-spaces
			8.times do
				if !folder[@counter].blank?
					id = folder[@counter].basename
					# Get image names and save them
					files = Dir.entries(folder[@counter]).select {|f| !File.directory? f}
						if !files.blank?
							# Take the thumb version
							if files[0].first(5) == "thumb"
								@adsArray[@success] = "/uploads/profil/image/#{id}/#{files[0]}"
							else
								@adsArray[@success] = "/uploads/profil/image/#{id}/thumb_#{files[0]}"
							end
							@success = @success + 1	
						end	
				end
				@counter = @counter + 1	
			end

			# All the empty elements in the Array of size 8 replace with placeholder
			@counter = 0
			8.times do
				if @adsArray[@counter].blank?
					@adsArray[@counter] = "placeholder"
				end
				@counter = @counter +1
			end
		end
		return @adsArray
	end

end