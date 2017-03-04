require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movie_index_url
    assert_response :success
  end

  test "should get show" do
    get movie_show_url
    assert_response :success
  end

end
