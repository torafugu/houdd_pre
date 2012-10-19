require 'test_helper'

class MoretinymobtrailsControllerTest < ActionController::TestCase
  setup do
    @moretinymobtrail = moretinymobtrails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moretinymobtrails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moretinymobtrail" do
    assert_difference('Moretinymobtrail.count') do
      post :create, moretinymobtrail: @moretinymobtrail.attributes
    end

    assert_redirected_to moretinymobtrail_path(assigns(:moretinymobtrail))
  end

  test "should show moretinymobtrail" do
    get :show, id: @moretinymobtrail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moretinymobtrail
    assert_response :success
  end

  test "should update moretinymobtrail" do
    put :update, id: @moretinymobtrail, moretinymobtrail: @moretinymobtrail.attributes
    assert_redirected_to moretinymobtrail_path(assigns(:moretinymobtrail))
  end

  test "should destroy moretinymobtrail" do
    assert_difference('Moretinymobtrail.count', -1) do
      delete :destroy, id: @moretinymobtrail
    end

    assert_redirected_to moretinymobtrails_path
  end
end
