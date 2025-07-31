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
end
