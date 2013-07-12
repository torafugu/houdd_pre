require 'test_helper'

class MediumMissionStrategiesControllerTest < ActionController::TestCase
  setup do
    @medium_mission_strategy = medium_mission_strategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_mission_strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_mission_strategy" do
    assert_difference('MediumMissionStrategy.count') do
      post :create, medium_mission_strategy: @medium_mission_strategy.attributes
    end

    assert_redirected_to medium_mission_strategy_path(assigns(:medium_mission_strategy))
  end

  test "should show medium_mission_strategy" do
    get :show, id: @medium_mission_strategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_mission_strategy
    assert_response :success
  end

  test "should update medium_mission_strategy" do
    put :update, id: @medium_mission_strategy, medium_mission_strategy: @medium_mission_strategy.attributes
    assert_redirected_to medium_mission_strategy_path(assigns(:medium_mission_strategy))
  end

  test "should destroy medium_mission_strategy" do
    assert_difference('MediumMissionStrategy.count', -1) do
      delete :destroy, id: @medium_mission_strategy
    end

    assert_redirected_to medium_mission_strategies_path
  end
end
