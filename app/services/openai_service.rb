# app/services/openai_service.rb

class OpenaiService
  def initialize(client = OpenAIClient)
    @client = client
  end

  def scrape_artist_details(artists)
    results = {}

    artists.each do |artist|
      messages = [
        { role: "system", content: "You are a helpful assistant that provides details about musical artists." },
        { role: "user", content: "
         We're looking for specific info related to '#{artist}'. I want you to find:
         - A short bio for the artist.
         - Their official website, prioritizing .com domains with clear artist branding.
         - Their Spotify, Apple Music, and SoundCloud links.
          - Use search terms like '[artist name] official site' and return verified results only — avoid fan pages or third-party profiles.
          The object returned will look like:
          {
          name: (artist name)
          bio: (artist bio)
          home_url: (homepage)
          sc_url: (soundcloud)
          am_url: (apple music)
          sp_url: (spotify)
          }"
        }
      ]

      response = @client.chat.completions.create(
          model: "gpt-4o-mini",
          messages: messages,
          temperature: 0.7
      )

      text = response.choices[0].message.content
      results[artist] = text
    end

    results
  end

  def scrape_image
    image = "https://cdn.prod.website-files.com/6644794b17e6ae9649cd47d3/67a50fe3512933fd7dd96641_FVDED%202025%20LINEUP.jpg"
    response = @client.responses.create(
      model: "gpt-4o-mini",
      input: [ {
        role: "user",
        content: [
          { type: "input_text", text: "After reading the text in the image, using your best judgement can you separate the text into a four part object:
          - The event's name (name)
          - The event's location (location)
          - The event's date (date)
          - The event's artists, seperated into an array. If B2B is included in the text, split artists like 'artist1 B2B artist2'. (artists)

          You can ignore any irrelevant info."
          },
          { type: "input_image", image_url: image }
        ]
      } ]
    )

    puts "#{response}"
    puts "-------"
    puts "#{response.output_text}"

    # for reference - example output text 

#     Here’s the information extracted from the image:

# - **name**: Fvded in the Park
# - **location**: Holland Park, BC
# - **date**: July 4-5, 2025
# - **artists**: [
#     "Tiësto",
#     "Kaytranada",
#     "Disclosure DJ Set",
#     "Black Tiger Sex Machine",
#     "Lane 8",
#     "Loud Luxury",
#     "RL Grime",
#     "Sammy Virji",
#     "Subtronics",
#     "Dabin",
#     "Rudim3ntal",
#     "Uncle Waffles",
#     "AC Slater",
#     "Cassian",
#     "DJ Heartstring",
#     "D.O.D",
#     "Juelz",
#     "Layton Giordani",
#     "Levity",
#     "Of The Trees",
#     "Partibo69",
#     "Peekaboo",
#     "Rebecca Black",
#     "Sabai",
#     "AK Sports",
#     "Goddard",
#     "Hainafromchina",
#     "Honeyluv",
#     "Jackie Hollander",
#     "Kitty Cash",
#     "Lavern",
#     "Maddy O’Neal",
#     "Mary Droppinz",
#     "Men Ü",
#     "Nick Leon",
#     "Nimino",
#     "Nooriyah",
#     "Riordan",
#     "Rova",
#     "San Pacho",
#     "Taylah Elaine",
#     "Werk",
#     "Zeemuffin",
#     "Zingara",
#     "Adam B2B Sayo",
#     "Aspen King",
#     "Badger (AU)",
#     "Buny",
#     "Chels",
#     "Donna Dada",
#     "Destrata",
#     "EtohB2BNemo",
#     "Keepsix",
#     "Kelland",
#     "Luca Fernandez",
#     "Marta",
#     "Teenoble",
#     "Wave Report"
# ]
  end
end
