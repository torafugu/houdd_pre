require 'test_helper'

class SmallmobunitsControllerTest < ActionController::TestCase
  setup do
    @smallmobunit = smallmobunits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallmobunits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallmobunit" do
    assert_difference('Smallmobunit.count') do
      post :create, smallmobunit: @smallmobunit.attributes
    end

    assert_redirected_to smallmobunit_path(assigns(:smallmobunit))
  end

  test "should show smallmobunit" do
    get :show, id: @smallmobunit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallmobunit
    assert_response :success
  end

  test "should update smallmobunit" do
    put :update, id: @smallmobunit, smallmobunit: @smallmobunit.attributes
    assert_redirected_to smallmobunit_path(assigns(:smallmobunit))
  end

  test "should destroy smallmobunit" do
    assert_difference('Smallmobunit.count', -1) do
      delete :destroy, id: @smallmobunit
    end

    assert_redirected_to smallmobunits_path
  end
end
