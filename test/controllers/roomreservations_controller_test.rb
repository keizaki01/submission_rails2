require "test_helper"

class RoomsreservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roomreservations_index_url
    assert_response :success
  end
end
