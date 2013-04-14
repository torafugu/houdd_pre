require 'test_helper'

class MostsmallmissionsControllerTest < ActionController::TestCase
  setup do
    @mostsmallmission = mostsmallmissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmission" do
    assert_difference('Mostsmallmission.count') do
      post :create, mostsmallmission: @mostsmallmission.attributes
    end

    assert_redirected_to mostsmallmission_path(assigns(:mostsmallmission))
  end

  test "should show mostsmallmission" do
    get :show, id: @mostsmallmission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmission
    assert_response :success
  end

  test "should update mostsmallmission" do
    put :update, id: @mostsmallmission, mostsmallmission: @mostsmallmission.attributes
    assert_redirected_to mostsmallmission_path(assigns(:mostsmallmission))
  end

  test "should destroy mostsmallmission" do
    assert_difference('Mostsmallmission.count', -1) do
      delete :destroy, id: @mostsmallmission
    end

    assert_redirected_to mostsmallmissions_path
  end
end
