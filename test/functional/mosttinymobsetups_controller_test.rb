require 'test_helper'

class MosttinymobsetupsControllerTest < ActionController::TestCase
  setup do
    @mosttinymobsetup = mosttinymobsetups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinymobsetups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinymobsetup" do
    assert_difference('Mosttinymobsetup.count') do
      post :create, mosttinymobsetup: @mosttinymobsetup.attributes
    end

    assert_redirected_to mosttinymobsetup_path(assigns(:mosttinymobsetup))
  end

  test "should show mosttinymobsetup" do
    get :show, id: @mosttinymobsetup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinymobsetup
    assert_response :success
  end

  test "should update mosttinymobsetup" do
    put :update, id: @mosttinymobsetup, mosttinymobsetup: @mosttinymobsetup.attributes
    assert_redirected_to mosttinymobsetup_path(assigns(:mosttinymobsetup))
  end

  test "should destroy mosttinymobsetup" do
    assert_difference('Mosttinymobsetup.count', -1) do
      delete :destroy, id: @mosttinymobsetup
    end

    assert_redirected_to mosttinymobsetups_path
  end
end
