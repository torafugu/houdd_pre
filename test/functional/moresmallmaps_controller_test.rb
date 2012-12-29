require 'test_helper'

class MoresmallmapsControllerTest < ActionController::TestCase
  setup do
    @moresmallmap = moresmallmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallmap" do
    assert_difference('Moresmallmap.count') do
      post :create, moresmallmap: @moresmallmap.attributes
    end

    assert_redirected_to moresmallmap_path(assigns(:moresmallmap))
  end

  test "should show moresmallmap" do
    get :show, id: @moresmallmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallmap
    assert_response :success
  end

  test "should update moresmallmap" do
    put :update, id: @moresmallmap, moresmallmap: @moresmallmap.attributes
    assert_redirected_to moresmallmap_path(assigns(:moresmallmap))
  end

  test "should destroy moresmallmap" do
    assert_difference('Moresmallmap.count', -1) do
      delete :destroy, id: @moresmallmap
    end

    assert_redirected_to moresmallmaps_path
  end
end
