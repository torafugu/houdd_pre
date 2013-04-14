require 'test_helper'

class MostsmalltreasurechestsControllerTest < ActionController::TestCase
  setup do
    @mostsmalltreasurechest = mostsmalltreasurechests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltreasurechests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltreasurechest" do
    assert_difference('Mostsmalltreasurechest.count') do
      post :create, mostsmalltreasurechest: @mostsmalltreasurechest.attributes
    end

    assert_redirected_to mostsmalltreasurechest_path(assigns(:mostsmalltreasurechest))
  end

  test "should show mostsmalltreasurechest" do
    get :show, id: @mostsmalltreasurechest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltreasurechest
    assert_response :success
  end

  test "should update mostsmalltreasurechest" do
    put :update, id: @mostsmalltreasurechest, mostsmalltreasurechest: @mostsmalltreasurechest.attributes
    assert_redirected_to mostsmalltreasurechest_path(assigns(:mostsmalltreasurechest))
  end

  test "should destroy mostsmalltreasurechest" do
    assert_difference('Mostsmalltreasurechest.count', -1) do
      delete :destroy, id: @mostsmalltreasurechest
    end

    assert_redirected_to mostsmalltreasurechests_path
  end
end
