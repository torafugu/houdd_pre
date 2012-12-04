require 'test_helper'

class MosttinybattlesControllerTest < ActionController::TestCase
  setup do
    @mosttinybattle = mosttinybattles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinybattles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinybattle" do
    assert_difference('Mosttinybattle.count') do
      post :create, mosttinybattle: @mosttinybattle.attributes
    end

    assert_redirected_to mosttinybattle_path(assigns(:mosttinybattle))
  end

  test "should show mosttinybattle" do
    get :show, id: @mosttinybattle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinybattle
    assert_response :success
  end

  test "should update mosttinybattle" do
    put :update, id: @mosttinybattle, mosttinybattle: @mosttinybattle.attributes
    assert_redirected_to mosttinybattle_path(assigns(:mosttinybattle))
  end

  test "should destroy mosttinybattle" do
    assert_difference('Mosttinybattle.count', -1) do
      delete :destroy, id: @mosttinybattle
    end

    assert_redirected_to mosttinybattles_path
  end
end
