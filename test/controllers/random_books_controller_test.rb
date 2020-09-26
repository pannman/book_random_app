require 'test_helper'

class RandomBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get random_path
    assert_response :success
  end



end
