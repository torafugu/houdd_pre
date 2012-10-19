require 'test_helper'

class MoretinymapsControllerTest < ActionController::TestCase
  setup do
    @moretinymap = moretinymaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moretinymaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moretinymap" do
    assert_difference('Moretinymap.count') do
      post :create, moretinymap: @moretinymap.attributes
    end

    assert_redirected_to moretinymap_path(assigns(:moretinymap))
  end

  test "should show moretinymap" do
    get :show, id: @moretinymap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moretinymap
    assert_response :success
  end

  test "should update moretinymap" do
    put :update, id: @moretinymap, moretinymap: @moretinymap.attributes
    assert_redirected_to moretinymap_path(assigns(:moretinymap))
  end

  test "should destroy moretinymap" do
    assert_difference('Moretinymap.count', -1) do
      delete :destroy, id: @moretinymap
    end

    assert_redirected_to moretinymaps_path
  end
end
