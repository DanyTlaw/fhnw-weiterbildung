json.array!(@profils) do |profil|
  json.extract! profil, :id, :user_id, :schulname, :standort, :fachbereich, :info, :link, :kurse
  json.url profil_url(profil, format: :json)
end
