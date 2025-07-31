# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Artist.destroy_all

artists = [
  {
    name: "Mau P",
    bio: "Electronic music producer known for deep house and techno vibes.",
    home_url: "https://maupmusic.com/",
    sc_url: "https://soundcloud.com/realmaup",
    am_url: "https://music.apple.com/artist/mau-p/1636676418",
    sp_url: "https://open.spotify.com/artist/0w1sbtZVQoK6GzV4A4OkCv"
  },
  {
    name: "Tiësto",
    bio: "Dutch DJ and record producer, a pioneering figure in electronic dance music.",
    home_url: "https://www.tiesto.com",
    sc_url: "https://soundcloud.com/tiesto",
    am_url: "https://music.apple.com/artist/ti%C3%ABsto/4091218",
    sp_url: "https://open.spotify.com/artist/09nPJtk4JVShxz6URAO8X3"
  },
  {
    name: "ALLEYCVT",
    bio: "Upcoming electronic artist with a distinct style.",
    home_url: "https://alleycvt.com/",
    sc_url: "https://soundcloud.com/alleycvt",
    am_url: nil,
    sp_url: "https://open.spotify.com/artist/4JxRK2gxmri7L7OWaxnVD1"
  },
  {
    name: "Martin Garrix",
    bio: "Dutch DJ and record producer famous worldwide for progressive house.",
    home_url: "https://martingarrix.com/",
    sc_url: "https://soundcloud.com/martingarrix",
    am_url: "https://music.apple.com/artist/martin-garrix/430932944",
    sp_url: "https://open.spotify.com/artist/60d24wfXkVzDSfLS6hyCjZ"
  },
  {
    name: "Proppa",
    bio: "Beatport artist profile, known for underground electronic beats.",
    home_url: nil,
    sc_url: "https://soundcloud.com/itsproppa",
    am_url: "https://music.apple.com/ca/artist/proppa/1466844115",
    sp_url: "https://open.spotify.com/artist/6h9guyYUhKLeDhyUVoOE68"
  },
  {
    name: "John Summit",
    bio: "American house DJ and producer with growing international recognition.",
    home_url: "https://johnsummitmusic.com/",
    sc_url: "https://soundcloud.com/johnsummit",
    am_url: "https://music.apple.com/artist/john-summit/1484335287",
    sp_url: "https://open.spotify.com/artist/7kNqXtgeIwFtelmRjWv205"
  }
]

artists.each do |artist_attrs|
  Artist.create!(artist_attrs)
end

puts "Seeded #{artists.size} artists."

venues = [
  {
    name: "The Velvet Room",
    location: "Toronto, ON",
    website: "https://www.velvetroomto.ca"
  },
  {
    name: "Echo Point Amphitheatre",
    location: "Los Angeles, CA",
    website: "https://www.echopointla.com"
  },
  {
    name: "Neon Cathedral",
    location: "San Francisco, CA",
    website: "https://www.neoncathedralsf.com"
  },
  {
    name: "The Lighthouse Lounge",
    location: "Vancouver, BC",
    website: "https://www.lighthouselounge.ca"
  }
]

venues.each do |venue|
  Venue.create!(venue)
end

puts "Seeded #{venues.size} venues."

events = [
  {
   name: "Roadhouse Festival",
   date: DateTime.new(2025, 10, 10, 20, 12, 0),
   location: "Vancouver, BC",
   venue_id: 4
  },
    {
   name: "SangFrang Festival",
   date: DateTime.new(2025, 10, 9, 20, 15, 0),
   location: "San Francisco, CA",
   venue_id: 3
  },
    {
   name: "Drake and Friends",
   date: DateTime.new(2025, 11, 6, 20, 15, 0),
   location: "Toronto, ON",
   venue_id: 1
  },
    {
   name: "Fakechella",
   date: DateTime.new(2025, 12, 25, 21, 30, 0),
   location: "Los Angeles, CA",
   venue_id: 2
  }
]

events.each do |event|
  Event.create!(event)
end

puts "Seeded #{events.size} events."

artists = Artist.all.to_a
events = Event.all.to_a

event_artist_records = []

artists.each do |artist|
  sample_events = events.sample(rand(2..4)) # pick 2-4 random events
  sample_events.each do |event|
    event_artist_records << { artist_id: artist.id, event_id: event.id }
  end
end

# Optional: Remove duplicates if any (shouldn't be necessary here)
event_artist_records.uniq!

EventArtist.destroy_all # clear old join records if needed
EventArtist.create!(event_artist_records)

puts "Seeded #{event_artist_records.size} event_artists with 2-4 events each per artist."
