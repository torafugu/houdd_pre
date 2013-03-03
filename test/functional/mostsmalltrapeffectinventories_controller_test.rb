require 'test_helper'

class MostsmalltrapeffectinventoriesControllerTest < ActionController::TestCase
  setup do
    @mostsmalltrapeffectinventory = mostsmalltrapeffectinventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltrapeffectinventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltrapeffectinventory" do
    assert_difference('Mostsmalltrapeffectinventory.count') do
      post :create, mostsmalltrapeffectinventory: @mostsmalltrapeffectinventory.attributes
    end

    assert_redirected_to mostsmalltrapeffectinventory_path(assigns(:mostsmalltrapeffectinventory))
  end

  test "should show mostsmalltrapeffectinventory" do
    get :show, id: @mostsmalltrapeffectinventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltrapeffectinventory
    assert_response :success
  end

  test "should update mostsmalltrapeffectinventory" do
    put :update, id: @mostsmalltrapeffectinventory, mostsmalltrapeffectinventory: @mostsmalltrapeffectinventory.attributes
    assert_redirected_to mostsmalltrapeffectinventory_path(assigns(:mostsmalltrapeffectinventory))
  end

  test "should destroy mostsmalltrapeffectinventory" do
    assert_difference('Mostsmalltrapeffectinventory.count', -1) do
      delete :destroy, id: @mostsmalltrapeffectinventory
    end

    assert_redirected_to mostsmalltrapeffectinventories_path
  end
end
