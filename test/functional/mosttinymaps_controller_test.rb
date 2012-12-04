require 'test_helper'

class MosttinymapsControllerTest < ActionController::TestCase
  setup do
    @mosttinymap = mosttinymaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinymaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinymap" do
    assert_difference('Mosttinymap.count') do
      post :create, mosttinymap: @mosttinymap.attributes
    end

    assert_redirected_to mosttinymap_path(assigns(:mosttinymap))
  end

  test "should show mosttinymap" do
    get :show, id: @mosttinymap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinymap
    assert_response :success
  end

  test "should update mosttinymap" do
    put :update, id: @mosttinymap, mosttinymap: @mosttinymap.attributes
    assert_redirected_to mosttinymap_path(assigns(:mosttinymap))
  end

  test "should destroy mosttinymap" do
    assert_difference('Mosttinymap.count', -1) do
      delete :destroy, id: @mosttinymap
    end

    assert_redirected_to mosttinymaps_path
  end
end
