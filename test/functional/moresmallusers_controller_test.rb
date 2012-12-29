require 'test_helper'

class MoresmallusersControllerTest < ActionController::TestCase
  setup do
    @moresmalluser = moresmallusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmalluser" do
    assert_difference('Moresmalluser.count') do
      post :create, moresmalluser: @moresmalluser.attributes
    end

    assert_redirected_to moresmalluser_path(assigns(:moresmalluser))
  end

  test "should show moresmalluser" do
    get :show, id: @moresmalluser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmalluser
    assert_response :success
  end

  test "should update moresmalluser" do
    put :update, id: @moresmalluser, moresmalluser: @moresmalluser.attributes
    assert_redirected_to moresmalluser_path(assigns(:moresmalluser))
  end

  test "should destroy moresmalluser" do
    assert_difference('Moresmalluser.count', -1) do
      delete :destroy, id: @moresmalluser
    end

    assert_redirected_to moresmallusers_path
  end
end
