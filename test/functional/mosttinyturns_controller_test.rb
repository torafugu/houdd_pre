require 'test_helper'

class MosttinyturnsControllerTest < ActionController::TestCase
  setup do
    @mosttinyturn = mosttinyturns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinyturns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinyturn" do
    assert_difference('Mosttinyturn.count') do
      post :create, mosttinyturn: @mosttinyturn.attributes
    end

    assert_redirected_to mosttinyturn_path(assigns(:mosttinyturn))
  end

  test "should show mosttinyturn" do
    get :show, id: @mosttinyturn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinyturn
    assert_response :success
  end

  test "should update mosttinyturn" do
    put :update, id: @mosttinyturn, mosttinyturn: @mosttinyturn.attributes
    assert_redirected_to mosttinyturn_path(assigns(:mosttinyturn))
  end

  test "should destroy mosttinyturn" do
    assert_difference('Mosttinyturn.count', -1) do
      delete :destroy, id: @mosttinyturn
    end

    assert_redirected_to mosttinyturns_path
  end
end
