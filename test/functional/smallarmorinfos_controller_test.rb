require 'test_helper'

class SmallarmorinfosControllerTest < ActionController::TestCase
  setup do
    @smallarmorinfo = smallarmorinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallarmorinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallarmorinfo" do
    assert_difference('Smallarmorinfo.count') do
      post :create, smallarmorinfo: @smallarmorinfo.attributes
    end

    assert_redirected_to smallarmorinfo_path(assigns(:smallarmorinfo))
  end

  test "should show smallarmorinfo" do
    get :show, id: @smallarmorinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallarmorinfo
    assert_response :success
  end

  test "should update smallarmorinfo" do
    put :update, id: @smallarmorinfo, smallarmorinfo: @smallarmorinfo.attributes
    assert_redirected_to smallarmorinfo_path(assigns(:smallarmorinfo))
  end

  test "should destroy smallarmorinfo" do
    assert_difference('Smallarmorinfo.count', -1) do
      delete :destroy, id: @smallarmorinfo
    end

    assert_redirected_to smallarmorinfos_path
  end
end
