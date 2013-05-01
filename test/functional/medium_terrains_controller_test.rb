require 'test_helper'

class MediumTerrainsControllerTest < ActionController::TestCase
  setup do
    @medium_terrain = medium_terrains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_terrains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_terrain" do
    assert_difference('MediumTerrain.count') do
      post :create, medium_terrain: @medium_terrain.attributes
    end

    assert_redirected_to medium_terrain_path(assigns(:medium_terrain))
  end

  test "should show medium_terrain" do
    get :show, id: @medium_terrain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_terrain
    assert_response :success
  end

  test "should update medium_terrain" do
    put :update, id: @medium_terrain, medium_terrain: @medium_terrain.attributes
    assert_redirected_to medium_terrain_path(assigns(:medium_terrain))
  end

  test "should destroy medium_terrain" do
    assert_difference('MediumTerrain.count', -1) do
      delete :destroy, id: @medium_terrain
    end

    assert_redirected_to medium_terrains_path
  end
end
