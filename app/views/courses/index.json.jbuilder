json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :promoter, :location, :kanton, :country, :mode, :certificate, :duration
  json.url course_url(course, format: :json)
end
