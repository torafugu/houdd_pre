require 'test_helper'

class MoretinymobinfosControllerTest < ActionController::TestCase
  setup do
    @moretinymobinfo = moretinymobinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moretinymobinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moretinymobinfo" do
    assert_difference('Moretinymobinfo.count') do
      post :create, moretinymobinfo: @moretinymobinfo.attributes
    end

    assert_redirected_to moretinymobinfo_path(assigns(:moretinymobinfo))
  end

  test "should show moretinymobinfo" do
    get :show, id: @moretinymobinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moretinymobinfo
    assert_response :success
  end

  test "should update moretinymobinfo" do
    put :update, id: @moretinymobinfo, moretinymobinfo: @moretinymobinfo.attributes
    assert_redirected_to moretinymobinfo_path(assigns(:moretinymobinfo))
  end

  test "should destroy moretinymobinfo" do
    assert_difference('Moretinymobinfo.count', -1) do
      delete :destroy, id: @moretinymobinfo
    end

    assert_redirected_to moretinymobinfos_path
  end
end
