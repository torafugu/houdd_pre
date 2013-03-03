require 'test_helper'

class MostsmallitemcategoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallitemcategory = mostsmallitemcategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallitemcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallitemcategory" do
    assert_difference('Mostsmallitemcategory.count') do
      post :create, mostsmallitemcategory: @mostsmallitemcategory.attributes
    end

    assert_redirected_to mostsmallitemcategory_path(assigns(:mostsmallitemcategory))
  end

  test "should show mostsmallitemcategory" do
    get :show, id: @mostsmallitemcategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallitemcategory
    assert_response :success
  end

  test "should update mostsmallitemcategory" do
    put :update, id: @mostsmallitemcategory, mostsmallitemcategory: @mostsmallitemcategory.attributes
    assert_redirected_to mostsmallitemcategory_path(assigns(:mostsmallitemcategory))
  end

  test "should destroy mostsmallitemcategory" do
    assert_difference('Mostsmallitemcategory.count', -1) do
      delete :destroy, id: @mostsmallitemcategory
    end

    assert_redirected_to mostsmallitemcategories_path
  end
end
