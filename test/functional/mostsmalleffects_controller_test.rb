require 'test_helper'

class MostsmalleffectsControllerTest < ActionController::TestCase
  setup do
    @mostsmalleffect = mostsmalleffects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalleffects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalleffect" do
    assert_difference('Mostsmalleffect.count') do
      post :create, mostsmalleffect: @mostsmalleffect.attributes
    end

    assert_redirected_to mostsmalleffect_path(assigns(:mostsmalleffect))
  end

  test "should show mostsmalleffect" do
    get :show, id: @mostsmalleffect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalleffect
    assert_response :success
  end

  test "should update mostsmalleffect" do
    put :update, id: @mostsmalleffect, mostsmalleffect: @mostsmalleffect.attributes
    assert_redirected_to mostsmalleffect_path(assigns(:mostsmalleffect))
  end

  test "should destroy mostsmalleffect" do
    assert_difference('Mostsmalleffect.count', -1) do
      delete :destroy, id: @mostsmalleffect
    end

    assert_redirected_to mostsmalleffects_path
  end
end
