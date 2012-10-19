require 'test_helper'

class MoretinymobbattlesControllerTest < ActionController::TestCase
  setup do
    @moretinymobbattle = moretinymobbattles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moretinymobbattles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moretinymobbattle" do
    assert_difference('Moretinymobbattle.count') do
      post :create, moretinymobbattle: @moretinymobbattle.attributes
    end

    assert_redirected_to moretinymobbattle_path(assigns(:moretinymobbattle))
  end

  test "should show moretinymobbattle" do
    get :show, id: @moretinymobbattle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moretinymobbattle
    assert_response :success
  end

  test "should update moretinymobbattle" do
    put :update, id: @moretinymobbattle, moretinymobbattle: @moretinymobbattle.attributes
    assert_redirected_to moretinymobbattle_path(assigns(:moretinymobbattle))
  end

  test "should destroy moretinymobbattle" do
    assert_difference('Moretinymobbattle.count', -1) do
      delete :destroy, id: @moretinymobbattle
    end

    assert_redirected_to moretinymobbattles_path
  end
end
