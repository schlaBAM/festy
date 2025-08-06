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

      info = response.choices[0].message.content
      results[artist] = info
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
          { type: "input_text", text: "After reading the text in the image, using your best judgement can you separate the text into just a four part JSON object:
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

    # example response = "```json\n{\n  \"name\": \"Fvded in the Park\",\n  \"location\": \"Holland Park, BC\",\n  \"date\": \"July 4-5, 2025\",\n  \"artists\": [\n    \"Tiësto\",\n    \"Kaytranada\",\n    \"Disclosure\",\n    \"Black Tiger Sex Machine\",\n    \"Lane 8\",\n    \"Loud Luxury\",\n    \"RL Grime\",\n    \"Sammy Virji\",\n    \"Subtronics\",\n    \"Dabin\",\n    \"Rudim3ntal\",\n    \"Uncle Waffles\",\n    \"AC Slater\",\n    \"Cassian\",\n    \"DJ Heartstring\",\n    \"D.O.D\",\n    \"Juelz\",\n    \"Layton Giordani\",\n    \"Levity\",\n    \"Of The Trees\",\n    \"Partiboi69\",\n    \"Peekaboo\",\n    \"Rebecca Black\",\n    \"Sabai\",\n    \"AK Sports\",\n    \"Goddard\",\n    \"Hainafromchina\",\n    \"Honeyluv\",\n    \"Jackie Hollander\",\n    \"Kitty Cash\",\n    \"Lavern\",\n    \"Maddy O'Neal\",\n    \"Mary Droppinz\",\n    \"Menú\",\n    \"Nick Leon\",\n    \"Nimino\",\n    \"Nooriyah\",\n    \"Riordan\",\n    \"Rova\",\n    \"San Pacho\",\n    \"Taylah Elaine\",\n    \"Werk\",\n    \"Zeemuffin\",\n    \"Zingara\",\n    \"Adam B2B Sayo\",\n    \"Aspen King\",\n    \"Badger (AU)\",\n    \"Buny\",\n    \"Chels\",\n    \"Donna Dada\",\n    \"Destrata\",\n    \"Etoh B2B Nemo\",\n    \"Keepsix\",\n    \"Kelland\",\n    \"Luca Fernandez\",\n    \"Marta\",\n    \"Teenoble\",\n    \"Wave Report\"\n  ]\n}\n```"

    parse_image(response.output_text)
  end

  def parse_image(output_text)
    result = output_text.gsub(/\A```json\s*|\s*```+\z/, "")
    JSON.parse(result)
  end
end
