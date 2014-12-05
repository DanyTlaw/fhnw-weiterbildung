module ApplicationHelper
	def randomAds

		@fname = "#{Rails.root}/public/uploads/profil/image"
		@ads = Pathname.new(@fname).children.select { |c| c.directory? }

		if !@ads.blank?
			@ads.shuffle
		end

	return @ads
	end

	def getImageAd(folder)
		@adsArray = Array.new
		@counter = 0
		folder.each do |ad|
			id = ad.basename
			files = Dir.entries(folder[@counter]).select {|f| !File.directory? f}
			@adsArray[@counter] = "/uploads/profil/image/#{id}/#{files[0]}"
			@counter = @counter + 1
		end

		return @adsArray
	end

end