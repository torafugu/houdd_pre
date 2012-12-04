require 'test_helper'

class MosttinytrialsControllerTest < ActionController::TestCase
  setup do
    @mosttinytrial = mosttinytrials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinytrials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinytrial" do
    assert_difference('Mosttinytrial.count') do
      post :create, mosttinytrial: @mosttinytrial.attributes
    end

    assert_redirected_to mosttinytrial_path(assigns(:mosttinytrial))
  end

  test "should show mosttinytrial" do
    get :show, id: @mosttinytrial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinytrial
    assert_response :success
  end

  test "should update mosttinytrial" do
    put :update, id: @mosttinytrial, mosttinytrial: @mosttinytrial.attributes
    assert_redirected_to mosttinytrial_path(assigns(:mosttinytrial))
  end

  test "should destroy mosttinytrial" do
    assert_difference('Mosttinytrial.count', -1) do
      delete :destroy, id: @mosttinytrial
    end

    assert_redirected_to mosttinytrials_path
  end
end
