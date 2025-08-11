require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "GET index returns success" do
    get artists_url
    assert_response :success
  end

  test "GET show returns success" do
    get artist_url(artists(:one))
    assert_response :success
  end

  test "GET show with inexistent id returns 404" do
    get "/artists/404"
    assert_response :missing
  end
end
