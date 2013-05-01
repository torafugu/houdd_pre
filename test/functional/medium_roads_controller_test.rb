require 'test_helper'

class MediumRoadsControllerTest < ActionController::TestCase
  setup do
    @medium_road = medium_roads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_roads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_road" do
    assert_difference('MediumRoad.count') do
      post :create, medium_road: @medium_road.attributes
    end

    assert_redirected_to medium_road_path(assigns(:medium_road))
  end

  test "should show medium_road" do
    get :show, id: @medium_road
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_road
    assert_response :success
  end

  test "should update medium_road" do
    put :update, id: @medium_road, medium_road: @medium_road.attributes
    assert_redirected_to medium_road_path(assigns(:medium_road))
  end

  test "should destroy medium_road" do
    assert_difference('MediumRoad.count', -1) do
      delete :destroy, id: @medium_road
    end

    assert_redirected_to medium_roads_path
  end
end
