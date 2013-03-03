require 'test_helper'

class MostsmallskilleffectinventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallskilleffectinventory = mostsmallskilleffectinventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallskilleffectinventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallskilleffectinventory" do
    assert_difference('Mostsmallskilleffectinventory.count') do
      post :create, mostsmallskilleffectinventory: @mostsmallskilleffectinventory.attributes
    end

    assert_redirected_to mostsmallskilleffectinventory_path(assigns(:mostsmallskilleffectinventory))
  end

  test "should show mostsmallskilleffectinventory" do
    get :show, id: @mostsmallskilleffectinventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallskilleffectinventory
    assert_response :success
  end

  test "should update mostsmallskilleffectinventory" do
    put :update, id: @mostsmallskilleffectinventory, mostsmallskilleffectinventory: @mostsmallskilleffectinventory.attributes
    assert_redirected_to mostsmallskilleffectinventory_path(assigns(:mostsmallskilleffectinventory))
  end

  test "should destroy mostsmallskilleffectinventory" do
    assert_difference('Mostsmallskilleffectinventory.count', -1) do
      delete :destroy, id: @mostsmallskilleffectinventory
    end

    assert_redirected_to mostsmallskilleffectinventories_path
  end
end
