require 'test_helper'

class SmallstrategiesControllerTest < ActionController::TestCase
  setup do
    @smallstrategy = smallstrategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallstrategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallstrategy" do
    assert_difference('Smallstrategy.count') do
      post :create, smallstrategy: @smallstrategy.attributes
    end

    assert_redirected_to smallstrategy_path(assigns(:smallstrategy))
  end

  test "should show smallstrategy" do
    get :show, id: @smallstrategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallstrategy
    assert_response :success
  end

  test "should update smallstrategy" do
    put :update, id: @smallstrategy, smallstrategy: @smallstrategy.attributes
    assert_redirected_to smallstrategy_path(assigns(:smallstrategy))
  end

  test "should destroy smallstrategy" do
    assert_difference('Smallstrategy.count', -1) do
      delete :destroy, id: @smallstrategy
    end

    assert_redirected_to smallstrategies_path
  end
end
