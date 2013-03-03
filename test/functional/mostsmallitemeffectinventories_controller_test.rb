require 'test_helper'

class MostsmallitemeffectinventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallitemeffectinventory = mostsmallitemeffectinventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallitemeffectinventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallitemeffectinventory" do
    assert_difference('Mostsmallitemeffectinventory.count') do
      post :create, mostsmallitemeffectinventory: @mostsmallitemeffectinventory.attributes
    end

    assert_redirected_to mostsmallitemeffectinventory_path(assigns(:mostsmallitemeffectinventory))
  end

  test "should show mostsmallitemeffectinventory" do
    get :show, id: @mostsmallitemeffectinventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallitemeffectinventory
    assert_response :success
  end

  test "should update mostsmallitemeffectinventory" do
    put :update, id: @mostsmallitemeffectinventory, mostsmallitemeffectinventory: @mostsmallitemeffectinventory.attributes
    assert_redirected_to mostsmallitemeffectinventory_path(assigns(:mostsmallitemeffectinventory))
  end

  test "should destroy mostsmallitemeffectinventory" do
    assert_difference('Mostsmallitemeffectinventory.count', -1) do
      delete :destroy, id: @mostsmallitemeffectinventory
    end

    assert_redirected_to mostsmallitemeffectinventories_path
  end
end
