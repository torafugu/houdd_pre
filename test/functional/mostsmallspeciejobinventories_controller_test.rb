require 'test_helper'

class MostsmallspeciejobinventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallspeciejobinventory = mostsmallspeciejobinventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallspeciejobinventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallspeciejobinventory" do
    assert_difference('Mostsmallspeciejobinventory.count') do
      post :create, mostsmallspeciejobinventory: @mostsmallspeciejobinventory.attributes
    end

    assert_redirected_to mostsmallspeciejobinventory_path(assigns(:mostsmallspeciejobinventory))
  end

  test "should show mostsmallspeciejobinventory" do
    get :show, id: @mostsmallspeciejobinventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallspeciejobinventory
    assert_response :success
  end

  test "should update mostsmallspeciejobinventory" do
    put :update, id: @mostsmallspeciejobinventory, mostsmallspeciejobinventory: @mostsmallspeciejobinventory.attributes
    assert_redirected_to mostsmallspeciejobinventory_path(assigns(:mostsmallspeciejobinventory))
  end

  test "should destroy mostsmallspeciejobinventory" do
    assert_difference('Mostsmallspeciejobinventory.count', -1) do
      delete :destroy, id: @mostsmallspeciejobinventory
    end

    assert_redirected_to mostsmallspeciejobinventories_path
  end
end
