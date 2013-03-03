require 'test_helper'

class MostsmallterritoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallterritory = mostsmallterritories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallterritories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallterritory" do
    assert_difference('Mostsmallterritory.count') do
      post :create, mostsmallterritory: @mostsmallterritory.attributes
    end

    assert_redirected_to mostsmallterritory_path(assigns(:mostsmallterritory))
  end

  test "should show mostsmallterritory" do
    get :show, id: @mostsmallterritory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallterritory
    assert_response :success
  end

  test "should update mostsmallterritory" do
    put :update, id: @mostsmallterritory, mostsmallterritory: @mostsmallterritory.attributes
    assert_redirected_to mostsmallterritory_path(assigns(:mostsmallterritory))
  end

  test "should destroy mostsmallterritory" do
    assert_difference('Mostsmallterritory.count', -1) do
      delete :destroy, id: @mostsmallterritory
    end

    assert_redirected_to mostsmallterritories_path
  end
end
