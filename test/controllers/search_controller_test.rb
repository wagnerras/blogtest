require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get articles" do
    get search_articles_url
    assert_response :success
  end

end
