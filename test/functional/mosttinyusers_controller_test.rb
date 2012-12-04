require 'test_helper'

class MosttinyusersControllerTest < ActionController::TestCase
  setup do
    @mosttinyuser = mosttinyusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinyusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinyuser" do
    assert_difference('Mosttinyuser.count') do
      post :create, mosttinyuser: @mosttinyuser.attributes
    end

    assert_redirected_to mosttinyuser_path(assigns(:mosttinyuser))
  end

  test "should show mosttinyuser" do
    get :show, id: @mosttinyuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinyuser
    assert_response :success
  end

  test "should update mosttinyuser" do
    put :update, id: @mosttinyuser, mosttinyuser: @mosttinyuser.attributes
    assert_redirected_to mosttinyuser_path(assigns(:mosttinyuser))
  end

  test "should destroy mosttinyuser" do
    assert_difference('Mosttinyuser.count', -1) do
      delete :destroy, id: @mosttinyuser
    end

    assert_redirected_to mosttinyusers_path
  end
end
