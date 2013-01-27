require 'test_helper'

class MoresmallweponinfosControllerTest < ActionController::TestCase
  setup do
    @moresmallweponinfo = moresmallweponinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallweponinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallweponinfo" do
    assert_difference('Moresmallweponinfo.count') do
      post :create, moresmallweponinfo: @moresmallweponinfo.attributes
    end

    assert_redirected_to moresmallweponinfo_path(assigns(:moresmallweponinfo))
  end

  test "should show moresmallweponinfo" do
    get :show, id: @moresmallweponinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallweponinfo
    assert_response :success
  end

  test "should update moresmallweponinfo" do
    put :update, id: @moresmallweponinfo, moresmallweponinfo: @moresmallweponinfo.attributes
    assert_redirected_to moresmallweponinfo_path(assigns(:moresmallweponinfo))
  end

  test "should destroy moresmallweponinfo" do
    assert_difference('Moresmallweponinfo.count', -1) do
      delete :destroy, id: @moresmallweponinfo
    end

    assert_redirected_to moresmallweponinfos_path
  end
end
