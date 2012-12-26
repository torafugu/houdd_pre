require 'test_helper'

class SmallmapsControllerTest < ActionController::TestCase
  setup do
    @smallmap = smallmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallmap" do
    assert_difference('Smallmap.count') do
      post :create, smallmap: @smallmap.attributes
    end

    assert_redirected_to smallmap_path(assigns(:smallmap))
  end

  test "should show smallmap" do
    get :show, id: @smallmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallmap
    assert_response :success
  end

  test "should update smallmap" do
    put :update, id: @smallmap, smallmap: @smallmap.attributes
    assert_redirected_to smallmap_path(assigns(:smallmap))
  end

  test "should destroy smallmap" do
    assert_difference('Smallmap.count', -1) do
      delete :destroy, id: @smallmap
    end

    assert_redirected_to smallmaps_path
  end
end
