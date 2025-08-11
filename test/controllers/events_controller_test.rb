require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "GET index returns success" do
    get events_url
    assert_response :success
  end

  test "GET show with real event returns success" do
    get event_url(events(:fakechella))
    assert_response :success
  end

  test "GET show with inexistent event returns 404" do
    get "/events/69420"
    assert_response :missing
  end

  test "request to nonexistent new action responds with 404" do
    get "/events/new"
    assert_response :missing
  end
end
