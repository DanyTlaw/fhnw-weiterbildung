module CoursesHelper
	def url_protocol(url)
		/^http/i.match(url) ? url : "http://#{url}"
	end
end
