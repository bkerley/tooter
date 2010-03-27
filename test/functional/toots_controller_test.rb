require 'test_helper'

class TootsControllerTest < ActionController::TestCase
  test "simple index toot" do
    get :index
    assert_response :success
    assert_select 'h1'
  end
end
