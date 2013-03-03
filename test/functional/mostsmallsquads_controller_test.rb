require 'test_helper'

class MostsmallsquadsControllerTest < ActionController::TestCase
  setup do
    @mostsmallsquad = mostsmallsquads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallsquads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallsquad" do
    assert_difference('Mostsmallsquad.count') do
      post :create, mostsmallsquad: @mostsmallsquad.attributes
    end

    assert_redirected_to mostsmallsquad_path(assigns(:mostsmallsquad))
  end

  test "should show mostsmallsquad" do
    get :show, id: @mostsmallsquad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallsquad
    assert_response :success
  end

  test "should update mostsmallsquad" do
    put :update, id: @mostsmallsquad, mostsmallsquad: @mostsmallsquad.attributes
    assert_redirected_to mostsmallsquad_path(assigns(:mostsmallsquad))
  end

  test "should destroy mostsmallsquad" do
    assert_difference('Mostsmallsquad.count', -1) do
      delete :destroy, id: @mostsmallsquad
    end

    assert_redirected_to mostsmallsquads_path
  end
end
