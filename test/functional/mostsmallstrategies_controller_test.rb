require 'test_helper'

class MostsmallstrategiesControllerTest < ActionController::TestCase
  setup do
    @mostsmallstrategy = mostsmallstrategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallstrategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallstrategy" do
    assert_difference('Mostsmallstrategy.count') do
      post :create, mostsmallstrategy: @mostsmallstrategy.attributes
    end

    assert_redirected_to mostsmallstrategy_path(assigns(:mostsmallstrategy))
  end

  test "should show mostsmallstrategy" do
    get :show, id: @mostsmallstrategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallstrategy
    assert_response :success
  end

  test "should update mostsmallstrategy" do
    put :update, id: @mostsmallstrategy, mostsmallstrategy: @mostsmallstrategy.attributes
    assert_redirected_to mostsmallstrategy_path(assigns(:mostsmallstrategy))
  end

  test "should destroy mostsmallstrategy" do
    assert_difference('Mostsmallstrategy.count', -1) do
      delete :destroy, id: @mostsmallstrategy
    end

    assert_redirected_to mostsmallstrategies_path
  end
end
