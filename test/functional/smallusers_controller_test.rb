require 'test_helper'

class SmallusersControllerTest < ActionController::TestCase
  setup do
    @smalluser = smallusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smalluser" do
    assert_difference('Smalluser.count') do
      post :create, smalluser: @smalluser.attributes
    end

    assert_redirected_to smalluser_path(assigns(:smalluser))
  end

  test "should show smalluser" do
    get :show, id: @smalluser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smalluser
    assert_response :success
  end

  test "should update smalluser" do
    put :update, id: @smalluser, smalluser: @smalluser.attributes
    assert_redirected_to smalluser_path(assigns(:smalluser))
  end

  test "should destroy smalluser" do
    assert_difference('Smalluser.count', -1) do
      delete :destroy, id: @smalluser
    end

    assert_redirected_to smallusers_path
  end
end
