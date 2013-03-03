require 'test_helper'

class MostsmalljobsControllerTest < ActionController::TestCase
  setup do
    @mostsmalljob = mostsmalljobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalljobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalljob" do
    assert_difference('Mostsmalljob.count') do
      post :create, mostsmalljob: @mostsmalljob.attributes
    end

    assert_redirected_to mostsmalljob_path(assigns(:mostsmalljob))
  end

  test "should show mostsmalljob" do
    get :show, id: @mostsmalljob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalljob
    assert_response :success
  end

  test "should update mostsmalljob" do
    put :update, id: @mostsmalljob, mostsmalljob: @mostsmalljob.attributes
    assert_redirected_to mostsmalljob_path(assigns(:mostsmalljob))
  end

  test "should destroy mostsmalljob" do
    assert_difference('Mostsmalljob.count', -1) do
      delete :destroy, id: @mostsmalljob
    end

    assert_redirected_to mostsmalljobs_path
  end
end
