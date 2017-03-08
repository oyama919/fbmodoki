require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topic_index_url
    assert_response :success
  end

  test "should get create" do
    get topic_create_url
    assert_response :success
  end

  test "should get show" do
    get topic_show_url
    assert_response :success
  end

  test "should get edit" do
    get topic_edit_url
    assert_response :success
  end

  test "should get delete" do
    get topic_delete_url
    assert_response :success
  end

end
