require 'test_helper'

class MoresmallmobinfosControllerTest < ActionController::TestCase
  setup do
    @moresmallmobinfo = moresmallmobinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallmobinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallmobinfo" do
    assert_difference('Moresmallmobinfo.count') do
      post :create, moresmallmobinfo: @moresmallmobinfo.attributes
    end

    assert_redirected_to moresmallmobinfo_path(assigns(:moresmallmobinfo))
  end

  test "should show moresmallmobinfo" do
    get :show, id: @moresmallmobinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallmobinfo
    assert_response :success
  end

  test "should update moresmallmobinfo" do
    put :update, id: @moresmallmobinfo, moresmallmobinfo: @moresmallmobinfo.attributes
    assert_redirected_to moresmallmobinfo_path(assigns(:moresmallmobinfo))
  end

  test "should destroy moresmallmobinfo" do
    assert_difference('Moresmallmobinfo.count', -1) do
      delete :destroy, id: @moresmallmobinfo
    end

    assert_redirected_to moresmallmobinfos_path
  end
end
