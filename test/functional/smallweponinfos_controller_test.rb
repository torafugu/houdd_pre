require 'test_helper'

class SmallweponinfosControllerTest < ActionController::TestCase
  setup do
    @smallweponinfo = smallweponinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallweponinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallweponinfo" do
    assert_difference('Smallweponinfo.count') do
      post :create, smallweponinfo: @smallweponinfo.attributes
    end

    assert_redirected_to smallweponinfo_path(assigns(:smallweponinfo))
  end

  test "should show smallweponinfo" do
    get :show, id: @smallweponinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallweponinfo
    assert_response :success
  end

  test "should update smallweponinfo" do
    put :update, id: @smallweponinfo, smallweponinfo: @smallweponinfo.attributes
    assert_redirected_to smallweponinfo_path(assigns(:smallweponinfo))
  end

  test "should destroy smallweponinfo" do
    assert_difference('Smallweponinfo.count', -1) do
      delete :destroy, id: @smallweponinfo
    end

    assert_redirected_to smallweponinfos_path
  end
end
