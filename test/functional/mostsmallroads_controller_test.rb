require 'test_helper'

class MostsmallroadsControllerTest < ActionController::TestCase
  setup do
    @mostsmallroad = mostsmallroads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallroads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallroad" do
    assert_difference('Mostsmallroad.count') do
      post :create, mostsmallroad: @mostsmallroad.attributes
    end

    assert_redirected_to mostsmallroad_path(assigns(:mostsmallroad))
  end

  test "should show mostsmallroad" do
    get :show, id: @mostsmallroad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallroad
    assert_response :success
  end

  test "should update mostsmallroad" do
    put :update, id: @mostsmallroad, mostsmallroad: @mostsmallroad.attributes
    assert_redirected_to mostsmallroad_path(assigns(:mostsmallroad))
  end

  test "should destroy mostsmallroad" do
    assert_difference('Mostsmallroad.count', -1) do
      delete :destroy, id: @mostsmallroad
    end

    assert_redirected_to mostsmallroads_path
  end
end
