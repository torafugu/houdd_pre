require 'test_helper'

class MediumDungeonsControllerTest < ActionController::TestCase
  setup do
    @medium_dungeon = medium_dungeons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_dungeons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_dungeon" do
    assert_difference('MediumDungeon.count') do
      post :create, medium_dungeon: @medium_dungeon.attributes
    end

    assert_redirected_to medium_dungeon_path(assigns(:medium_dungeon))
  end

  test "should show medium_dungeon" do
    get :show, id: @medium_dungeon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_dungeon
    assert_response :success
  end

  test "should update medium_dungeon" do
    put :update, id: @medium_dungeon, medium_dungeon: @medium_dungeon.attributes
    assert_redirected_to medium_dungeon_path(assigns(:medium_dungeon))
  end

  test "should destroy medium_dungeon" do
    assert_difference('MediumDungeon.count', -1) do
      delete :destroy, id: @medium_dungeon
    end

    assert_redirected_to medium_dungeons_path
  end
end
