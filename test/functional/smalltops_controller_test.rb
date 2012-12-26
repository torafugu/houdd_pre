require 'test_helper'

class SmalltopsControllerTest < ActionController::TestCase
  setup do
    @smalltop = smalltops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smalltops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smalltop" do
    assert_difference('Smalltop.count') do
      post :create, smalltop: @smalltop.attributes
    end

    assert_redirected_to smalltop_path(assigns(:smalltop))
  end

  test "should show smalltop" do
    get :show, id: @smalltop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smalltop
    assert_response :success
  end

  test "should update smalltop" do
    put :update, id: @smalltop, smalltop: @smalltop.attributes
    assert_redirected_to smalltop_path(assigns(:smalltop))
  end

  test "should destroy smalltop" do
    assert_difference('Smalltop.count', -1) do
      delete :destroy, id: @smalltop
    end

    assert_redirected_to smalltops_path
  end
end
