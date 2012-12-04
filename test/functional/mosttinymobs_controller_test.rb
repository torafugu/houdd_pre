require 'test_helper'

class MosttinymobsControllerTest < ActionController::TestCase
  setup do
    @mosttinymob = mosttinymobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mosttinymobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mosttinymob" do
    assert_difference('Mosttinymob.count') do
      post :create, mosttinymob: @mosttinymob.attributes
    end

    assert_redirected_to mosttinymob_path(assigns(:mosttinymob))
  end

  test "should show mosttinymob" do
    get :show, id: @mosttinymob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mosttinymob
    assert_response :success
  end

  test "should update mosttinymob" do
    put :update, id: @mosttinymob, mosttinymob: @mosttinymob.attributes
    assert_redirected_to mosttinymob_path(assigns(:mosttinymob))
  end

  test "should destroy mosttinymob" do
    assert_difference('Mosttinymob.count', -1) do
      delete :destroy, id: @mosttinymob
    end

    assert_redirected_to mosttinymobs_path
  end
end
