require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get fashion" do
    get :fashion
    assert_response :success
  end

  test "should get activity" do
    get :activity
    assert_response :success
  end

  test "should get brand" do
    get :brand
    assert_response :success
  end

  test "should get good" do
    get :good
    assert_response :success
  end

end
