require 'test_helper'

class MosttinystrategiesControllerTest < ActionController::TestCase
  setup do
    @mosttinystrategy = mosttinystrategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinystrategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinystrategy" do
    assert_difference('Mosttinystrategy.count') do
      post :create, mosttinystrategy: @mosttinystrategy.attributes
    end

    assert_redirected_to mosttinystrategy_path(assigns(:mosttinystrategy))
  end

  test "should show mosttinystrategy" do
    get :show, id: @mosttinystrategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinystrategy
    assert_response :success
  end

  test "should update mosttinystrategy" do
    put :update, id: @mosttinystrategy, mosttinystrategy: @mosttinystrategy.attributes
    assert_redirected_to mosttinystrategy_path(assigns(:mosttinystrategy))
  end

  test "should destroy mosttinystrategy" do
    assert_difference('Mosttinystrategy.count', -1) do
      delete :destroy, id: @mosttinystrategy
    end

    assert_redirected_to mosttinystrategies_path
  end
end
