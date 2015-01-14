json.array!(@people) do |person|
  json.extract! person, :id, :name, :email, :contact
  json.url person_url(person, format: :json)
end
