require 'test_helper'

class MoresmalltopsControllerTest < ActionController::TestCase
  setup do
    @moresmalltop = moresmalltops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmalltops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmalltop" do
    assert_difference('Moresmalltop.count') do
      post :create, moresmalltop: @moresmalltop.attributes
    end

    assert_redirected_to moresmalltop_path(assigns(:moresmalltop))
  end

  test "should show moresmalltop" do
    get :show, id: @moresmalltop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmalltop
    assert_response :success
  end

  test "should update moresmalltop" do
    put :update, id: @moresmalltop, moresmalltop: @moresmalltop.attributes
    assert_redirected_to moresmalltop_path(assigns(:moresmalltop))
  end

  test "should destroy moresmalltop" do
    assert_difference('Moresmalltop.count', -1) do
      delete :destroy, id: @moresmalltop
    end

    assert_redirected_to moresmalltops_path
  end
end
