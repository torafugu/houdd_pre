require 'test_helper'

class MosttinymobinfosControllerTest < ActionController::TestCase
  setup do
    @mosttinymobinfo = mosttinymobinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinymobinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinymobinfo" do
    assert_difference('Mosttinymobinfo.count') do
      post :create, mosttinymobinfo: @mosttinymobinfo.attributes
    end

    assert_redirected_to mosttinymobinfo_path(assigns(:mosttinymobinfo))
  end

  test "should show mosttinymobinfo" do
    get :show, id: @mosttinymobinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinymobinfo
    assert_response :success
  end

  test "should update mosttinymobinfo" do
    put :update, id: @mosttinymobinfo, mosttinymobinfo: @mosttinymobinfo.attributes
    assert_redirected_to mosttinymobinfo_path(assigns(:mosttinymobinfo))
  end

  test "should destroy mosttinymobinfo" do
    assert_difference('Mosttinymobinfo.count', -1) do
      delete :destroy, id: @mosttinymobinfo
    end

    assert_redirected_to mosttinymobinfos_path
  end
end
