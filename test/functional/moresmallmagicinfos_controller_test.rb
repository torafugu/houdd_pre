require 'test_helper'

class MoresmallmagicinfosControllerTest < ActionController::TestCase
  setup do
    @moresmallmagicinfo = moresmallmagicinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallmagicinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallmagicinfo" do
    assert_difference('Moresmallmagicinfo.count') do
      post :create, moresmallmagicinfo: @moresmallmagicinfo.attributes
    end

    assert_redirected_to moresmallmagicinfo_path(assigns(:moresmallmagicinfo))
  end

  test "should show moresmallmagicinfo" do
    get :show, id: @moresmallmagicinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallmagicinfo
    assert_response :success
  end

  test "should update moresmallmagicinfo" do
    put :update, id: @moresmallmagicinfo, moresmallmagicinfo: @moresmallmagicinfo.attributes
    assert_redirected_to moresmallmagicinfo_path(assigns(:moresmallmagicinfo))
  end

  test "should destroy moresmallmagicinfo" do
    assert_difference('Moresmallmagicinfo.count', -1) do
      delete :destroy, id: @moresmallmagicinfo
    end

    assert_redirected_to moresmallmagicinfos_path
  end
end
