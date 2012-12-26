require 'test_helper'

class SmallmobsquadsControllerTest < ActionController::TestCase
  setup do
    @smallmobsquad = smallmobsquads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smallmobsquads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smallmobsquad" do
    assert_difference('Smallmobsquad.count') do
      post :create, smallmobsquad: @smallmobsquad.attributes
    end

    assert_redirected_to smallmobsquad_path(assigns(:smallmobsquad))
  end

  test "should show smallmobsquad" do
    get :show, id: @smallmobsquad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smallmobsquad
    assert_response :success
  end

  test "should update smallmobsquad" do
    put :update, id: @smallmobsquad, smallmobsquad: @smallmobsquad.attributes
    assert_redirected_to smallmobsquad_path(assigns(:smallmobsquad))
  end

  test "should destroy smallmobsquad" do
    assert_difference('Smallmobsquad.count', -1) do
      delete :destroy, id: @smallmobsquad
    end

    assert_redirected_to smallmobsquads_path
  end
end
