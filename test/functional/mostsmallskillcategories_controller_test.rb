require 'test_helper'

class MostsmallskillcategoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallskillcategory = mostsmallskillcategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallskillcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallskillcategory" do
    assert_difference('Mostsmallskillcategory.count') do
      post :create, mostsmallskillcategory: @mostsmallskillcategory.attributes
    end

    assert_redirected_to mostsmallskillcategory_path(assigns(:mostsmallskillcategory))
  end

  test "should show mostsmallskillcategory" do
    get :show, id: @mostsmallskillcategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallskillcategory
    assert_response :success
  end

  test "should update mostsmallskillcategory" do
    put :update, id: @mostsmallskillcategory, mostsmallskillcategory: @mostsmallskillcategory.attributes
    assert_redirected_to mostsmallskillcategory_path(assigns(:mostsmallskillcategory))
  end

  test "should destroy mostsmallskillcategory" do
    assert_difference('Mostsmallskillcategory.count', -1) do
      delete :destroy, id: @mostsmallskillcategory
    end

    assert_redirected_to mostsmallskillcategories_path
  end
end
