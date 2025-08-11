require "test_helper"

class ArtistEventsControllerTest < ActionDispatch::IntegrationTest
  test "GET index returns success" do
    get artist_events_url(artists(:one))
    assert_response :success
  end
end
