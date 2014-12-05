module ApplicationHelper
	def randomAds

		@fname = "#{Rails.root}/public/uploads/profil/image"
		@ads = Pathname.new(@fname).children.select { |c| c.directory? }
		if @ads.blank?
			puts "juhuu"
		else
			puts @ads[0]
			@ads.shuffle
		end

	return @ads
	end

	def getImageAd(folder)
		@id = File.basename(folder[0])
		puts folder[0]
		@files = Dir.entries(folder).select {|f| !File.directory? f}
		puts @files[0]
		puts "#{@id}/#{@files[0]}"
		return "/uploads/#{@id}/#{@files[0]}"
	end

end