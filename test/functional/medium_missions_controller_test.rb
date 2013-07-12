require 'test_helper'

class MediumMissionsControllerTest < ActionController::TestCase
  setup do
    @medium_mission = medium_missions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_missions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_mission" do
    assert_difference('MediumMission.count') do
      post :create, medium_mission: @medium_mission.attributes
    end

    assert_redirected_to medium_mission_path(assigns(:medium_mission))
  end

  test "should show medium_mission" do
    get :show, id: @medium_mission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_mission
    assert_response :success
  end

  test "should update medium_mission" do
    put :update, id: @medium_mission, medium_mission: @medium_mission.attributes
    assert_redirected_to medium_mission_path(assigns(:medium_mission))
  end

  test "should destroy medium_mission" do
    assert_difference('MediumMission.count', -1) do
      delete :destroy, id: @medium_mission
    end

    assert_redirected_to medium_missions_path
  end
end
