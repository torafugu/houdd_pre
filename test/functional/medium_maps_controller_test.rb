require 'test_helper'

class MediumMapsControllerTest < ActionController::TestCase
  setup do
    @medium_map = medium_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_map" do
    assert_difference('MediumMap.count') do
      post :create, medium_map: @medium_map.attributes
    end

    assert_redirected_to medium_map_path(assigns(:medium_map))
  end

  test "should show medium_map" do
    get :show, id: @medium_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_map
    assert_response :success
  end

  test "should update medium_map" do
    put :update, id: @medium_map, medium_map: @medium_map.attributes
    assert_redirected_to medium_map_path(assigns(:medium_map))
  end

  test "should destroy medium_map" do
    assert_difference('MediumMap.count', -1) do
      delete :destroy, id: @medium_map
    end

    assert_redirected_to medium_maps_path
  end
end
