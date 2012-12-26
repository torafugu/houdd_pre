require 'test_helper'

class SmallmobinfosControllerTest < ActionController::TestCase
  setup do
    @smallmobinfo = smallmobinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallmobinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallmobinfo" do
    assert_difference('Smallmobinfo.count') do
      post :create, smallmobinfo: @smallmobinfo.attributes
    end

    assert_redirected_to smallmobinfo_path(assigns(:smallmobinfo))
  end

  test "should show smallmobinfo" do
    get :show, id: @smallmobinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallmobinfo
    assert_response :success
  end

  test "should update smallmobinfo" do
    put :update, id: @smallmobinfo, smallmobinfo: @smallmobinfo.attributes
    assert_redirected_to smallmobinfo_path(assigns(:smallmobinfo))
  end

  test "should destroy smallmobinfo" do
    assert_difference('Smallmobinfo.count', -1) do
      delete :destroy, id: @smallmobinfo
    end

    assert_redirected_to smallmobinfos_path
  end
end
