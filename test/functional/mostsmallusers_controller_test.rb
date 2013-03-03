require 'test_helper'

class MostsmallusersControllerTest < ActionController::TestCase
  setup do
    @mostsmalluser = mostsmallusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalluser" do
    assert_difference('Mostsmalluser.count') do
      post :create, mostsmalluser: @mostsmalluser.attributes
    end

    assert_redirected_to mostsmalluser_path(assigns(:mostsmalluser))
  end

  test "should show mostsmalluser" do
    get :show, id: @mostsmalluser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalluser
    assert_response :success
  end

  test "should update mostsmalluser" do
    put :update, id: @mostsmalluser, mostsmalluser: @mostsmalluser.attributes
    assert_redirected_to mostsmalluser_path(assigns(:mostsmalluser))
  end

  test "should destroy mostsmalluser" do
    assert_difference('Mostsmalluser.count', -1) do
      delete :destroy, id: @mostsmalluser
    end

    assert_redirected_to mostsmallusers_path
  end
end
