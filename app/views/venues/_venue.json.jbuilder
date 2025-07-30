json.extract! venue, :id, :name, :location, :website, :created_at, :updated_at
json.url venue_url(venue, format: :json)
