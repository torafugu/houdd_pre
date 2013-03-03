require 'test_helper'

class MostsmalltrapsControllerTest < ActionController::TestCase
  setup do
    @mostsmalltrap = mostsmalltraps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltraps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltrap" do
    assert_difference('Mostsmalltrap.count') do
      post :create, mostsmalltrap: @mostsmalltrap.attributes
    end

    assert_redirected_to mostsmalltrap_path(assigns(:mostsmalltrap))
  end

  test "should show mostsmalltrap" do
    get :show, id: @mostsmalltrap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltrap
    assert_response :success
  end

  test "should update mostsmalltrap" do
    put :update, id: @mostsmalltrap, mostsmalltrap: @mostsmalltrap.attributes
    assert_redirected_to mostsmalltrap_path(assigns(:mostsmalltrap))
  end

  test "should destroy mostsmalltrap" do
    assert_difference('Mostsmalltrap.count', -1) do
      delete :destroy, id: @mostsmalltrap
    end

    assert_redirected_to mostsmalltraps_path
  end
end
