require "test_helper"

class ArtistEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get only:index" do
    get artist_events_only:index_url
    assert_response :success
  end
end
