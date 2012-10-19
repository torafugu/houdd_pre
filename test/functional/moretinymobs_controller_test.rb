require 'test_helper'

class MoretinymobsControllerTest < ActionController::TestCase
  setup do
    @moretinymob = moretinymobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moretinymobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moretinymob" do
    assert_difference('Moretinymob.count') do
      post :create, moretinymob: @moretinymob.attributes
    end

    assert_redirected_to moretinymob_path(assigns(:moretinymob))
  end

  test "should show moretinymob" do
    get :show, id: @moretinymob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moretinymob
    assert_response :success
  end

  test "should update moretinymob" do
    put :update, id: @moretinymob, moretinymob: @moretinymob.attributes
    assert_redirected_to moretinymob_path(assigns(:moretinymob))
  end

  test "should destroy moretinymob" do
    assert_difference('Moretinymob.count', -1) do
      delete :destroy, id: @moretinymob
    end

    assert_redirected_to moretinymobs_path
  end
end
