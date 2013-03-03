require 'test_helper'

class MostsmallconstructionsControllerTest < ActionController::TestCase
  setup do
    @mostsmallconstruction = mostsmallconstructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallconstructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallconstruction" do
    assert_difference('Mostsmallconstruction.count') do
      post :create, mostsmallconstruction: @mostsmallconstruction.attributes
    end

    assert_redirected_to mostsmallconstruction_path(assigns(:mostsmallconstruction))
  end

  test "should show mostsmallconstruction" do
    get :show, id: @mostsmallconstruction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallconstruction
    assert_response :success
  end

  test "should update mostsmallconstruction" do
    put :update, id: @mostsmallconstruction, mostsmallconstruction: @mostsmallconstruction.attributes
    assert_redirected_to mostsmallconstruction_path(assigns(:mostsmallconstruction))
  end

  test "should destroy mostsmallconstruction" do
    assert_difference('Mostsmallconstruction.count', -1) do
      delete :destroy, id: @mostsmallconstruction
    end

    assert_redirected_to mostsmallconstructions_path
  end
end
