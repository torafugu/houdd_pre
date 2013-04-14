require 'test_helper'

class MostsmalltreasureitemsControllerTest < ActionController::TestCase
  setup do
    @mostsmalltreasureitem = mostsmalltreasureitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltreasureitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltreasureitem" do
    assert_difference('Mostsmalltreasureitem.count') do
      post :create, mostsmalltreasureitem: @mostsmalltreasureitem.attributes
    end

    assert_redirected_to mostsmalltreasureitem_path(assigns(:mostsmalltreasureitem))
  end

  test "should show mostsmalltreasureitem" do
    get :show, id: @mostsmalltreasureitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltreasureitem
    assert_response :success
  end

  test "should update mostsmalltreasureitem" do
    put :update, id: @mostsmalltreasureitem, mostsmalltreasureitem: @mostsmalltreasureitem.attributes
    assert_redirected_to mostsmalltreasureitem_path(assigns(:mostsmalltreasureitem))
  end

  test "should destroy mostsmalltreasureitem" do
    assert_difference('Mostsmalltreasureitem.count', -1) do
      delete :destroy, id: @mostsmalltreasureitem
    end

    assert_redirected_to mostsmalltreasureitems_path
  end
end
