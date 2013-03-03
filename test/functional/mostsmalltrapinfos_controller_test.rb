require 'test_helper'

class MostsmalltrapinfosControllerTest < ActionController::TestCase
  setup do
    @mostsmalltrapinfo = mostsmalltrapinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltrapinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltrapinfo" do
    assert_difference('Mostsmalltrapinfo.count') do
      post :create, mostsmalltrapinfo: @mostsmalltrapinfo.attributes
    end

    assert_redirected_to mostsmalltrapinfo_path(assigns(:mostsmalltrapinfo))
  end

  test "should show mostsmalltrapinfo" do
    get :show, id: @mostsmalltrapinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltrapinfo
    assert_response :success
  end

  test "should update mostsmalltrapinfo" do
    put :update, id: @mostsmalltrapinfo, mostsmalltrapinfo: @mostsmalltrapinfo.attributes
    assert_redirected_to mostsmalltrapinfo_path(assigns(:mostsmalltrapinfo))
  end

  test "should destroy mostsmalltrapinfo" do
    assert_difference('Mostsmalltrapinfo.count', -1) do
      delete :destroy, id: @mostsmalltrapinfo
    end

    assert_redirected_to mostsmalltrapinfos_path
  end
end
