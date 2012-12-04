require 'test_helper'

class MosttinymobtrailsControllerTest < ActionController::TestCase
  setup do
    @mosttinymobtrail = mosttinymobtrails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinymobtrails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinymobtrail" do
    assert_difference('Mosttinymobtrail.count') do
      post :create, mosttinymobtrail: @mosttinymobtrail.attributes
    end

    assert_redirected_to mosttinymobtrail_path(assigns(:mosttinymobtrail))
  end

  test "should show mosttinymobtrail" do
    get :show, id: @mosttinymobtrail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinymobtrail
    assert_response :success
  end

  test "should update mosttinymobtrail" do
    put :update, id: @mosttinymobtrail, mosttinymobtrail: @mosttinymobtrail.attributes
    assert_redirected_to mosttinymobtrail_path(assigns(:mosttinymobtrail))
  end

  test "should destroy mosttinymobtrail" do
    assert_difference('Mosttinymobtrail.count', -1) do
      delete :destroy, id: @mosttinymobtrail
    end

    assert_redirected_to mosttinymobtrails_path
  end
end
