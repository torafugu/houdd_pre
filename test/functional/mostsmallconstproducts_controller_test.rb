require 'test_helper'

class MostsmallconstproductsControllerTest < ActionController::TestCase
  setup do
    @mostsmallconstproduct = mostsmallconstproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallconstproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallconstproduct" do
    assert_difference('Mostsmallconstproduct.count') do
      post :create, mostsmallconstproduct: @mostsmallconstproduct.attributes
    end

    assert_redirected_to mostsmallconstproduct_path(assigns(:mostsmallconstproduct))
  end

  test "should show mostsmallconstproduct" do
    get :show, id: @mostsmallconstproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallconstproduct
    assert_response :success
  end

  test "should update mostsmallconstproduct" do
    put :update, id: @mostsmallconstproduct, mostsmallconstproduct: @mostsmallconstproduct.attributes
    assert_redirected_to mostsmallconstproduct_path(assigns(:mostsmallconstproduct))
  end

  test "should destroy mostsmallconstproduct" do
    assert_difference('Mostsmallconstproduct.count', -1) do
      delete :destroy, id: @mostsmallconstproduct
    end

    assert_redirected_to mostsmallconstproducts_path
  end
end
