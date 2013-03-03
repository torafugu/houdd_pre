require 'test_helper'

class MostsmallequipslotinventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallequipslotinventory = mostsmallequipslotinventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallequipslotinventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallequipslotinventory" do
    assert_difference('Mostsmallequipslotinventory.count') do
      post :create, mostsmallequipslotinventory: @mostsmallequipslotinventory.attributes
    end

    assert_redirected_to mostsmallequipslotinventory_path(assigns(:mostsmallequipslotinventory))
  end

  test "should show mostsmallequipslotinventory" do
    get :show, id: @mostsmallequipslotinventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallequipslotinventory
    assert_response :success
  end

  test "should update mostsmallequipslotinventory" do
    put :update, id: @mostsmallequipslotinventory, mostsmallequipslotinventory: @mostsmallequipslotinventory.attributes
    assert_redirected_to mostsmallequipslotinventory_path(assigns(:mostsmallequipslotinventory))
  end

  test "should destroy mostsmallequipslotinventory" do
    assert_difference('Mostsmallequipslotinventory.count', -1) do
      delete :destroy, id: @mostsmallequipslotinventory
    end

    assert_redirected_to mostsmallequipslotinventories_path
  end
end
