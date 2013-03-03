require 'test_helper'

class MostsmallitemequipinventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallitemequipinventory = mostsmallitemequipinventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallitemequipinventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallitemequipinventory" do
    assert_difference('Mostsmallitemequipinventory.count') do
      post :create, mostsmallitemequipinventory: @mostsmallitemequipinventory.attributes
    end

    assert_redirected_to mostsmallitemequipinventory_path(assigns(:mostsmallitemequipinventory))
  end

  test "should show mostsmallitemequipinventory" do
    get :show, id: @mostsmallitemequipinventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallitemequipinventory
    assert_response :success
  end

  test "should update mostsmallitemequipinventory" do
    put :update, id: @mostsmallitemequipinventory, mostsmallitemequipinventory: @mostsmallitemequipinventory.attributes
    assert_redirected_to mostsmallitemequipinventory_path(assigns(:mostsmallitemequipinventory))
  end

  test "should destroy mostsmallitemequipinventory" do
    assert_difference('Mostsmallitemequipinventory.count', -1) do
      delete :destroy, id: @mostsmallitemequipinventory
    end

    assert_redirected_to mostsmallitemequipinventories_path
  end
end
