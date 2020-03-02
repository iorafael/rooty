require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get create_or_destroy" do
    get participants_create_or_destroy_url
    assert_response :success
  end

end
