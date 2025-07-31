class ArtistEventsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @events = @artist.events.includes(:venue)
  end
end
