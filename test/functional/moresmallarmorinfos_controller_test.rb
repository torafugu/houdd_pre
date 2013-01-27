require 'test_helper'

class MoresmallarmorinfosControllerTest < ActionController::TestCase
  setup do
    @moresmallarmorinfo = moresmallarmorinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallarmorinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallarmorinfo" do
    assert_difference('Moresmallarmorinfo.count') do
      post :create, moresmallarmorinfo: @moresmallarmorinfo.attributes
    end

    assert_redirected_to moresmallarmorinfo_path(assigns(:moresmallarmorinfo))
  end

  test "should show moresmallarmorinfo" do
    get :show, id: @moresmallarmorinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallarmorinfo
    assert_response :success
  end

  test "should update moresmallarmorinfo" do
    put :update, id: @moresmallarmorinfo, moresmallarmorinfo: @moresmallarmorinfo.attributes
    assert_redirected_to moresmallarmorinfo_path(assigns(:moresmallarmorinfo))
  end

  test "should destroy moresmallarmorinfo" do
    assert_difference('Moresmallarmorinfo.count', -1) do
      delete :destroy, id: @moresmallarmorinfo
    end

    assert_redirected_to moresmallarmorinfos_path
  end
end
