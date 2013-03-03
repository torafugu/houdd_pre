require 'test_helper'

class MostsmallterrainproductsControllerTest < ActionController::TestCase
  setup do
    @mostsmallterrainproduct = mostsmallterrainproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallterrainproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallterrainproduct" do
    assert_difference('Mostsmallterrainproduct.count') do
      post :create, mostsmallterrainproduct: @mostsmallterrainproduct.attributes
    end

    assert_redirected_to mostsmallterrainproduct_path(assigns(:mostsmallterrainproduct))
  end

  test "should show mostsmallterrainproduct" do
    get :show, id: @mostsmallterrainproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallterrainproduct
    assert_response :success
  end

  test "should update mostsmallterrainproduct" do
    put :update, id: @mostsmallterrainproduct, mostsmallterrainproduct: @mostsmallterrainproduct.attributes
    assert_redirected_to mostsmallterrainproduct_path(assigns(:mostsmallterrainproduct))
  end

  test "should destroy mostsmallterrainproduct" do
    assert_difference('Mostsmallterrainproduct.count', -1) do
      delete :destroy, id: @mostsmallterrainproduct
    end

    assert_redirected_to mostsmallterrainproducts_path
  end
end
