require 'test_helper'

class MostsmallmobsControllerTest < ActionController::TestCase
  setup do
    @mostsmallmob = mostsmallmobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmob" do
    assert_difference('Mostsmallmob.count') do
      post :create, mostsmallmob: @mostsmallmob.attributes
    end

    assert_redirected_to mostsmallmob_path(assigns(:mostsmallmob))
  end

  test "should show mostsmallmob" do
    get :show, id: @mostsmallmob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmob
    assert_response :success
  end

  test "should update mostsmallmob" do
    put :update, id: @mostsmallmob, mostsmallmob: @mostsmallmob.attributes
    assert_redirected_to mostsmallmob_path(assigns(:mostsmallmob))
  end

  test "should destroy mostsmallmob" do
    assert_difference('Mostsmallmob.count', -1) do
      delete :destroy, id: @mostsmallmob
    end

    assert_redirected_to mostsmallmobs_path
  end
end
