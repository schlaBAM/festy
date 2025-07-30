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
    address: "123 King Street",
    city: "Toronto",
    state: "ON",
    country: "Canada",
    capacity: 850,
    timezone: "America/Toronto"
  },
  {
    name: "Echo Point Amphitheatre",
    address: "456 Sunset Blvd",
    city: "Los Angeles",
    state: "CA",
    country: "USA",
    capacity: 5000,
    timezone: "America/Los_Angeles"
  },
  {
    name: "Neon Cathedral",
    address: "789 Market Street",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    capacity: 1200,
    timezone: "America/Los_Angeles"
  },
  {
    name: "The Lighthouse Lounge",
    address: "321 Ocean Drive",
    city: "Vancouver",
    state: "BC",
    country: "Canada",
    capacity: 600,
    timezone: "America/Vancouver"
  }
]

venues.each do |venue|
  Venue.create!(venue)
end

puts "Seeded #{venues.size} venues."
