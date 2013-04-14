require 'test_helper'

class MostsmallmissioncategoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmallmissioncategory = mostsmallmissioncategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmissioncategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmissioncategory" do
    assert_difference('Mostsmallmissioncategory.count') do
      post :create, mostsmallmissioncategory: @mostsmallmissioncategory.attributes
    end

    assert_redirected_to mostsmallmissioncategory_path(assigns(:mostsmallmissioncategory))
  end

  test "should show mostsmallmissioncategory" do
    get :show, id: @mostsmallmissioncategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmissioncategory
    assert_response :success
  end

  test "should update mostsmallmissioncategory" do
    put :update, id: @mostsmallmissioncategory, mostsmallmissioncategory: @mostsmallmissioncategory.attributes
    assert_redirected_to mostsmallmissioncategory_path(assigns(:mostsmallmissioncategory))
  end

  test "should destroy mostsmallmissioncategory" do
    assert_difference('Mostsmallmissioncategory.count', -1) do
      delete :destroy, id: @mostsmallmissioncategory
    end

    assert_redirected_to mostsmallmissioncategories_path
  end
end
