require 'test_helper'

class MoresmallmobsControllerTest < ActionController::TestCase
  setup do
    @moresmallmob = moresmallmobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallmobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallmob" do
    assert_difference('Moresmallmob.count') do
      post :create, moresmallmob: @moresmallmob.attributes
    end

    assert_redirected_to moresmallmob_path(assigns(:moresmallmob))
  end

  test "should show moresmallmob" do
    get :show, id: @moresmallmob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallmob
    assert_response :success
  end

  test "should update moresmallmob" do
    put :update, id: @moresmallmob, moresmallmob: @moresmallmob.attributes
    assert_redirected_to moresmallmob_path(assigns(:moresmallmob))
  end

  test "should destroy moresmallmob" do
    assert_difference('Moresmallmob.count', -1) do
      delete :destroy, id: @moresmallmob
    end

    assert_redirected_to moresmallmobs_path
  end
end
