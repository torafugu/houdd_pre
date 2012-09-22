require 'test_helper'

class TinymapsControllerTest < ActionController::TestCase
  setup do
    @tinymap = tinymaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tinymaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tinymap" do
    assert_difference('Tinymap.count') do
      post :create, tinymap: @tinymap.attributes
    end

    assert_redirected_to tinymap_path(assigns(:tinymap))
  end

  test "should show tinymap" do
    get :show, id: @tinymap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tinymap
    assert_response :success
  end

  test "should update tinymap" do
    put :update, id: @tinymap, tinymap: @tinymap.attributes
    assert_redirected_to tinymap_path(assigns(:tinymap))
  end

  test "should destroy tinymap" do
    assert_difference('Tinymap.count', -1) do
      delete :destroy, id: @tinymap
    end

    assert_redirected_to tinymaps_path
  end
end
