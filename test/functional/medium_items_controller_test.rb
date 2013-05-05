require 'test_helper'

class MediumItemsControllerTest < ActionController::TestCase
  setup do
    @medium_item = medium_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_item" do
    assert_difference('MediumItem.count') do
      post :create, medium_item: @medium_item.attributes
    end

    assert_redirected_to medium_item_path(assigns(:medium_item))
  end

  test "should show medium_item" do
    get :show, id: @medium_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_item
    assert_response :success
  end

  test "should update medium_item" do
    put :update, id: @medium_item, medium_item: @medium_item.attributes
    assert_redirected_to medium_item_path(assigns(:medium_item))
  end

  test "should destroy medium_item" do
    assert_difference('MediumItem.count', -1) do
      delete :destroy, id: @medium_item
    end

    assert_redirected_to medium_items_path
  end
end
