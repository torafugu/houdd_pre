require 'test_helper'

class MostsmalliteminfosControllerTest < ActionController::TestCase
  setup do
    @mostsmalliteminfo = mostsmalliteminfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalliteminfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalliteminfo" do
    assert_difference('Mostsmalliteminfo.count') do
      post :create, mostsmalliteminfo: @mostsmalliteminfo.attributes
    end

    assert_redirected_to mostsmalliteminfo_path(assigns(:mostsmalliteminfo))
  end

  test "should show mostsmalliteminfo" do
    get :show, id: @mostsmalliteminfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalliteminfo
    assert_response :success
  end

  test "should update mostsmalliteminfo" do
    put :update, id: @mostsmalliteminfo, mostsmalliteminfo: @mostsmalliteminfo.attributes
    assert_redirected_to mostsmalliteminfo_path(assigns(:mostsmalliteminfo))
  end

  test "should destroy mostsmalliteminfo" do
    assert_difference('Mostsmalliteminfo.count', -1) do
      delete :destroy, id: @mostsmalliteminfo
    end

    assert_redirected_to mostsmalliteminfos_path
  end
end
