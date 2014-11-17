json.array!(@courses) do |course|
  json.extract! course, :id, :titel, :kurstyp, :start, :anbieter, :ort, :preis, :inhalt, :zielpublikum, :zulassung, :abschluss, :info, :leitung, :kontakt, :image
  json.url course_url(course, format: :json)
end
