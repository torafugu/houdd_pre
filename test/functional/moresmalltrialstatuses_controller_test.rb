require 'test_helper'

class MoresmalltrialstatusesControllerTest < ActionController::TestCase
  setup do
    @moresmalltrialstatus = moresmalltrialstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmalltrialstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmalltrialstatus" do
    assert_difference('Moresmalltrialstatus.count') do
      post :create, moresmalltrialstatus: @moresmalltrialstatus.attributes
    end

    assert_redirected_to moresmalltrialstatus_path(assigns(:moresmalltrialstatus))
  end

  test "should show moresmalltrialstatus" do
    get :show, id: @moresmalltrialstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmalltrialstatus
    assert_response :success
  end

  test "should update moresmalltrialstatus" do
    put :update, id: @moresmalltrialstatus, moresmalltrialstatus: @moresmalltrialstatus.attributes
    assert_redirected_to moresmalltrialstatus_path(assigns(:moresmalltrialstatus))
  end

  test "should destroy moresmalltrialstatus" do
    assert_difference('Moresmalltrialstatus.count', -1) do
      delete :destroy, id: @moresmalltrialstatus
    end

    assert_redirected_to moresmalltrialstatuses_path
  end
end
