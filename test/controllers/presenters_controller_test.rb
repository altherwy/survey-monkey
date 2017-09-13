require 'test_helper'

class PresentersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get presenters_new_url
    assert_response :success
  end

  test "should get update" do
    get presenters_update_url
    assert_response :success
  end

  test "should get delete" do
    get presenters_delete_url
    assert_response :success
  end

end
