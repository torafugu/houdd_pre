require 'test_helper'

class MostsmallconstructioninfosControllerTest < ActionController::TestCase
  setup do
    @mostsmallconstructioninfo = mostsmallconstructioninfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallconstructioninfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallconstructioninfo" do
    assert_difference('Mostsmallconstructioninfo.count') do
      post :create, mostsmallconstructioninfo: @mostsmallconstructioninfo.attributes
    end

    assert_redirected_to mostsmallconstructioninfo_path(assigns(:mostsmallconstructioninfo))
  end

  test "should show mostsmallconstructioninfo" do
    get :show, id: @mostsmallconstructioninfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallconstructioninfo
    assert_response :success
  end

  test "should update mostsmallconstructioninfo" do
    put :update, id: @mostsmallconstructioninfo, mostsmallconstructioninfo: @mostsmallconstructioninfo.attributes
    assert_redirected_to mostsmallconstructioninfo_path(assigns(:mostsmallconstructioninfo))
  end

  test "should destroy mostsmallconstructioninfo" do
    assert_difference('Mostsmallconstructioninfo.count', -1) do
      delete :destroy, id: @mostsmallconstructioninfo
    end

    assert_redirected_to mostsmallconstructioninfos_path
  end
end
