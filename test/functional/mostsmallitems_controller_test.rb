require 'test_helper'

class MostsmallitemsControllerTest < ActionController::TestCase
  setup do
    @mostsmallitem = mostsmallitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallitem" do
    assert_difference('Mostsmallitem.count') do
      post :create, mostsmallitem: @mostsmallitem.attributes
    end

    assert_redirected_to mostsmallitem_path(assigns(:mostsmallitem))
  end

  test "should show mostsmallitem" do
    get :show, id: @mostsmallitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallitem
    assert_response :success
  end

  test "should update mostsmallitem" do
    put :update, id: @mostsmallitem, mostsmallitem: @mostsmallitem.attributes
    assert_redirected_to mostsmallitem_path(assigns(:mostsmallitem))
  end

  test "should destroy mostsmallitem" do
    assert_difference('Mostsmallitem.count', -1) do
      delete :destroy, id: @mostsmallitem
    end

    assert_redirected_to mostsmallitems_path
  end
end
