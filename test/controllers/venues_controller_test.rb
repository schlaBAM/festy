require "test_helper"

class VenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venue = venues(:msg)
  end

  test "GET index returns success" do
    get venues_url
    assert_response :success
  end

  test "GET new returns success" do
    get new_venue_url
    assert_response :success
  end

  test "should create venue" do
    assert_difference("Venue.count") do
      post venues_url, params: { venue: { location: @venue.location, name: @venue.name, website: @venue.website } }
    end

    assert_redirected_to venue_url(Venue.last)
  end

  test "GET show returns success" do
    get venue_url(@venue)
    assert_response :success
  end

  test "should update venue" do
    patch venue_url(@venue), params: { venue: { location: @venue.location, name: @venue.name, website: @venue.website } }
    assert_redirected_to venue_url(@venue)
  end

  test "should destroy venue" do
    assert_difference("Venue.count", -1) do
      delete venue_url(@venue)
    end

    assert_redirected_to venues_url
  end
end
