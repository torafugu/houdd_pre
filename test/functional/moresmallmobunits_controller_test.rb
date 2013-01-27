require 'test_helper'

class MoresmallmobunitsControllerTest < ActionController::TestCase
  setup do
    @moresmallmobunit = moresmallmobunits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallmobunits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallmobunit" do
    assert_difference('Moresmallmobunit.count') do
      post :create, moresmallmobunit: @moresmallmobunit.attributes
    end

    assert_redirected_to moresmallmobunit_path(assigns(:moresmallmobunit))
  end

  test "should show moresmallmobunit" do
    get :show, id: @moresmallmobunit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallmobunit
    assert_response :success
  end

  test "should update moresmallmobunit" do
    put :update, id: @moresmallmobunit, moresmallmobunit: @moresmallmobunit.attributes
    assert_redirected_to moresmallmobunit_path(assigns(:moresmallmobunit))
  end

  test "should destroy moresmallmobunit" do
    assert_difference('Moresmallmobunit.count', -1) do
      delete :destroy, id: @moresmallmobunit
    end

    assert_redirected_to moresmallmobunits_path
  end
end
