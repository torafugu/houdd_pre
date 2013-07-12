require 'test_helper'

class MediumMissionInvsControllerTest < ActionController::TestCase
  setup do
    @medium_mission_inv = medium_mission_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_mission_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_mission_inv" do
    assert_difference('MediumMissionInv.count') do
      post :create, medium_mission_inv: @medium_mission_inv.attributes
    end

    assert_redirected_to medium_mission_inv_path(assigns(:medium_mission_inv))
  end

  test "should show medium_mission_inv" do
    get :show, id: @medium_mission_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_mission_inv
    assert_response :success
  end

  test "should update medium_mission_inv" do
    put :update, id: @medium_mission_inv, medium_mission_inv: @medium_mission_inv.attributes
    assert_redirected_to medium_mission_inv_path(assigns(:medium_mission_inv))
  end

  test "should destroy medium_mission_inv" do
    assert_difference('MediumMissionInv.count', -1) do
      delete :destroy, id: @medium_mission_inv
    end

    assert_redirected_to medium_mission_invs_path
  end
end
