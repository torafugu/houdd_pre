require 'test_helper'

class MediumAtkInfosControllerTest < ActionController::TestCase
  setup do
    @medium_atk_info = medium_atk_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_atk_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_atk_info" do
    assert_difference('MediumAtkInfo.count') do
      post :create, medium_atk_info: @medium_atk_info.attributes
    end

    assert_redirected_to medium_atk_info_path(assigns(:medium_atk_info))
  end

  test "should show medium_atk_info" do
    get :show, id: @medium_atk_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_atk_info
    assert_response :success
  end

  test "should update medium_atk_info" do
    put :update, id: @medium_atk_info, medium_atk_info: @medium_atk_info.attributes
    assert_redirected_to medium_atk_info_path(assigns(:medium_atk_info))
  end

  test "should destroy medium_atk_info" do
    assert_difference('MediumAtkInfo.count', -1) do
      delete :destroy, id: @medium_atk_info
    end

    assert_redirected_to medium_atk_infos_path
  end
end
