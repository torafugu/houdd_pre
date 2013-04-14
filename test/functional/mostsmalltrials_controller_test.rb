require 'test_helper'

class MostsmalltrialsControllerTest < ActionController::TestCase
  setup do
    @mostsmalltrial = mostsmalltrials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltrials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltrial" do
    assert_difference('Mostsmalltrial.count') do
      post :create, mostsmalltrial: @mostsmalltrial.attributes
    end

    assert_redirected_to mostsmalltrial_path(assigns(:mostsmalltrial))
  end

  test "should show mostsmalltrial" do
    get :show, id: @mostsmalltrial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltrial
    assert_response :success
  end

  test "should update mostsmalltrial" do
    put :update, id: @mostsmalltrial, mostsmalltrial: @mostsmalltrial.attributes
    assert_redirected_to mostsmalltrial_path(assigns(:mostsmalltrial))
  end

  test "should destroy mostsmalltrial" do
    assert_difference('Mostsmalltrial.count', -1) do
      delete :destroy, id: @mostsmalltrial
    end

    assert_redirected_to mostsmalltrials_path
  end
end
