require 'test_helper'

class MoresmallstrategiesControllerTest < ActionController::TestCase
  setup do
    @moresmallstrategy = moresmallstrategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallstrategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallstrategy" do
    assert_difference('Moresmallstrategy.count') do
      post :create, moresmallstrategy: @moresmallstrategy.attributes
    end

    assert_redirected_to moresmallstrategy_path(assigns(:moresmallstrategy))
  end

  test "should show moresmallstrategy" do
    get :show, id: @moresmallstrategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallstrategy
    assert_response :success
  end

  test "should update moresmallstrategy" do
    put :update, id: @moresmallstrategy, moresmallstrategy: @moresmallstrategy.attributes
    assert_redirected_to moresmallstrategy_path(assigns(:moresmallstrategy))
  end

  test "should destroy moresmallstrategy" do
    assert_difference('Moresmallstrategy.count', -1) do
      delete :destroy, id: @moresmallstrategy
    end

    assert_redirected_to moresmallstrategies_path
  end
end
