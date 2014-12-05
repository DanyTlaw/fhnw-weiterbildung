module ApplicationHelper
	def randomAds

		@fname = "#{Rails.root}/public/uploads/profil/image"
		@ads = Pathname.new(@fname).children.select { |c| c.directory? }

		if !@ads.blank?
			@ads.shuffle!
		end

	return @ads
	end

	def getImageAd(folder)
		puts "getImageAd"
		@adsArray = Array.new
		@counter = 0
		if folder.blank?
			@adsArray[0] = "placeholder"
			@adsArray[1] = "placeholder"
			@adsArray[2] = "placeholder"
			@adsArray[3] = "placeholder"
			@adsArray[4] = "placeholder"
		else
			@success = 0
			8.times do
				if !folder[@counter].blank?
					id = folder[@counter].basename
					files = Dir.entries(folder[@counter]).select {|f| !File.directory? f}
						if !files.blank?
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