require 'test_helper'

class MediumDungeonCellsControllerTest < ActionController::TestCase
  setup do
    @medium_dungeon_cell = medium_dungeon_cells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_dungeon_cells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_dungeon_cell" do
    assert_difference('MediumDungeonCell.count') do
      post :create, medium_dungeon_cell: @medium_dungeon_cell.attributes
    end

    assert_redirected_to medium_dungeon_cell_path(assigns(:medium_dungeon_cell))
  end

  test "should show medium_dungeon_cell" do
    get :show, id: @medium_dungeon_cell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_dungeon_cell
    assert_response :success
  end

  test "should update medium_dungeon_cell" do
    put :update, id: @medium_dungeon_cell, medium_dungeon_cell: @medium_dungeon_cell.attributes
    assert_redirected_to medium_dungeon_cell_path(assigns(:medium_dungeon_cell))
  end

  test "should destroy medium_dungeon_cell" do
    assert_difference('MediumDungeonCell.count', -1) do
      delete :destroy, id: @medium_dungeon_cell
    end

    assert_redirected_to medium_dungeon_cells_path
  end
end
