require 'test_helper'

class MostsmallmobspeciesControllerTest < ActionController::TestCase
  setup do
    @mostsmallmobspecy = mostsmallmobspecies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmobspecies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmobspecy" do
    assert_difference('Mostsmallmobspecie.count') do
      post :create, mostsmallmobspecy: @mostsmallmobspecy.attributes
    end

    assert_redirected_to mostsmallmobspecy_path(assigns(:mostsmallmobspecy))
  end

  test "should show mostsmallmobspecy" do
    get :show, id: @mostsmallmobspecy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmobspecy
    assert_response :success
  end

  test "should update mostsmallmobspecy" do
    put :update, id: @mostsmallmobspecy, mostsmallmobspecy: @mostsmallmobspecy.attributes
    assert_redirected_to mostsmallmobspecy_path(assigns(:mostsmallmobspecy))
  end

  test "should destroy mostsmallmobspecy" do
    assert_difference('Mostsmallmobspecie.count', -1) do
      delete :destroy, id: @mostsmallmobspecy
    end

    assert_redirected_to mostsmallmobspecies_path
  end
end
