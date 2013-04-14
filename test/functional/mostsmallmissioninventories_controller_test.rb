require 'test_helper'

class MostsmallmissioninventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallmissioninventory = mostsmallmissioninventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmissioninventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmissioninventory" do
    assert_difference('Mostsmallmissioninventory.count') do
      post :create, mostsmallmissioninventory: @mostsmallmissioninventory.attributes
    end

    assert_redirected_to mostsmallmissioninventory_path(assigns(:mostsmallmissioninventory))
  end

  test "should show mostsmallmissioninventory" do
    get :show, id: @mostsmallmissioninventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmissioninventory
    assert_response :success
  end

  test "should update mostsmallmissioninventory" do
    put :update, id: @mostsmallmissioninventory, mostsmallmissioninventory: @mostsmallmissioninventory.attributes
    assert_redirected_to mostsmallmissioninventory_path(assigns(:mostsmallmissioninventory))
  end

  test "should destroy mostsmallmissioninventory" do
    assert_difference('Mostsmallmissioninventory.count', -1) do
      delete :destroy, id: @mostsmallmissioninventory
    end

    assert_redirected_to mostsmallmissioninventories_path
  end
end
