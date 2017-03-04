require 'test_helper'

class CollectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collection_index_url
    assert_response :success
  end

end
