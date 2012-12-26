require 'test_helper'

class SmallmagicinfosControllerTest < ActionController::TestCase
  setup do
    @smallmagicinfo = smallmagicinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallmagicinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallmagicinfo" do
    assert_difference('Smallmagicinfo.count') do
      post :create, smallmagicinfo: @smallmagicinfo.attributes
    end

    assert_redirected_to smallmagicinfo_path(assigns(:smallmagicinfo))
  end

  test "should show smallmagicinfo" do
    get :show, id: @smallmagicinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallmagicinfo
    assert_response :success
  end

  test "should update smallmagicinfo" do
    put :update, id: @smallmagicinfo, smallmagicinfo: @smallmagicinfo.attributes
    assert_redirected_to smallmagicinfo_path(assigns(:smallmagicinfo))
  end

  test "should destroy smallmagicinfo" do
    assert_difference('Smallmagicinfo.count', -1) do
      delete :destroy, id: @smallmagicinfo
    end

    assert_redirected_to smallmagicinfos_path
  end
end
