require 'test_helper'

class SmalltrialstatusesControllerTest < ActionController::TestCase
  setup do
    @smalltrialstatus = smalltrialstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smalltrialstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smalltrialstatus" do
    assert_difference('Smalltrialstatus.count') do
      post :create, smalltrialstatus: @smalltrialstatus.attributes
    end

    assert_redirected_to smalltrialstatus_path(assigns(:smalltrialstatus))
  end

  test "should show smalltrialstatus" do
    get :show, id: @smalltrialstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smalltrialstatus
    assert_response :success
  end

  test "should update smalltrialstatus" do
    put :update, id: @smalltrialstatus, smalltrialstatus: @smalltrialstatus.attributes
    assert_redirected_to smalltrialstatus_path(assigns(:smalltrialstatus))
  end

  test "should destroy smalltrialstatus" do
    assert_difference('Smalltrialstatus.count', -1) do
      delete :destroy, id: @smalltrialstatus
    end

    assert_redirected_to smalltrialstatuses_path
  end
end
