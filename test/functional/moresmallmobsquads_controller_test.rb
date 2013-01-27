require 'test_helper'

class MoresmallmobsquadsControllerTest < ActionController::TestCase
  setup do
    @moresmallmobsquad = moresmallmobsquads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmallmobsquads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmallmobsquad" do
    assert_difference('Moresmallmobsquad.count') do
      post :create, moresmallmobsquad: @moresmallmobsquad.attributes
    end

    assert_redirected_to moresmallmobsquad_path(assigns(:moresmallmobsquad))
  end

  test "should show moresmallmobsquad" do
    get :show, id: @moresmallmobsquad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmallmobsquad
    assert_response :success
  end

  test "should update moresmallmobsquad" do
    put :update, id: @moresmallmobsquad, moresmallmobsquad: @moresmallmobsquad.attributes
    assert_redirected_to moresmallmobsquad_path(assigns(:moresmallmobsquad))
  end

  test "should destroy moresmallmobsquad" do
    assert_difference('Moresmallmobsquad.count', -1) do
      delete :destroy, id: @moresmallmobsquad
    end

    assert_redirected_to moresmallmobsquads_path
  end
end
