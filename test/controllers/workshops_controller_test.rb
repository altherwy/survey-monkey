require 'test_helper'

class WorkshopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workshops_new_url
    assert_response :success
  end

  test "should get update" do
    get workshops_update_url
    assert_response :success
  end

  test "should get delete" do
    get workshops_delete_url
    assert_response :success
  end

end
