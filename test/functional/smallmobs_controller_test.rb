require 'test_helper'

class SmallmobsControllerTest < ActionController::TestCase
  setup do
    @smallmob = smallmobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallmobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallmob" do
    assert_difference('Smallmob.count') do
      post :create, smallmob: @smallmob.attributes
    end

    assert_redirected_to smallmob_path(assigns(:smallmob))
  end

  test "should show smallmob" do
    get :show, id: @smallmob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallmob
    assert_response :success
  end

  test "should update smallmob" do
    put :update, id: @smallmob, smallmob: @smallmob.attributes
    assert_redirected_to smallmob_path(assigns(:smallmob))
  end

  test "should destroy smallmob" do
    assert_difference('Smallmob.count', -1) do
      delete :destroy, id: @smallmob
    end

    assert_redirected_to smallmobs_path
  end
end
