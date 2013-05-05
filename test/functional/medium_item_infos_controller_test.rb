require 'test_helper'

class MediumItemInfosControllerTest < ActionController::TestCase
  setup do
    @medium_item_info = medium_item_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_item_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_item_info" do
    assert_difference('MediumItemInfo.count') do
      post :create, medium_item_info: @medium_item_info.attributes
    end

    assert_redirected_to medium_item_info_path(assigns(:medium_item_info))
  end

  test "should show medium_item_info" do
    get :show, id: @medium_item_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_item_info
    assert_response :success
  end

  test "should update medium_item_info" do
    put :update, id: @medium_item_info, medium_item_info: @medium_item_info.attributes
    assert_redirected_to medium_item_info_path(assigns(:medium_item_info))
  end

  test "should destroy medium_item_info" do
    assert_difference('MediumItemInfo.count', -1) do
      delete :destroy, id: @medium_item_info
    end

    assert_redirected_to medium_item_infos_path
  end
end
