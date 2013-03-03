require 'test_helper'

class MostsmallelementsControllerTest < ActionController::TestCase
  setup do
    @mostsmallelement = mostsmallelements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallelements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallelement" do
    assert_difference('Mostsmallelement.count') do
      post :create, mostsmallelement: @mostsmallelement.attributes
    end

    assert_redirected_to mostsmallelement_path(assigns(:mostsmallelement))
  end

  test "should show mostsmallelement" do
    get :show, id: @mostsmallelement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallelement
    assert_response :success
  end

  test "should update mostsmallelement" do
    put :update, id: @mostsmallelement, mostsmallelement: @mostsmallelement.attributes
    assert_redirected_to mostsmallelement_path(assigns(:mostsmallelement))
  end

  test "should destroy mostsmallelement" do
    assert_difference('Mostsmallelement.count', -1) do
      delete :destroy, id: @mostsmallelement
    end

    assert_redirected_to mostsmallelements_path
  end
end
