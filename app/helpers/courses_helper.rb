module CoursesHelper

	# Check if the input is a url
	def url_protocol(url)
		/^http/i.match(url) ? url : "http://#{url}"
	end
end
