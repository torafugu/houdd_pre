require 'test_helper'

class MediumMapCellsControllerTest < ActionController::TestCase
  setup do
    @medium_map_cell = medium_map_cells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_map_cells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_map_cell" do
    assert_difference('MediumMapCell.count') do
      post :create, medium_map_cell: @medium_map_cell.attributes
    end

    assert_redirected_to medium_map_cell_path(assigns(:medium_map_cell))
  end

  test "should show medium_map_cell" do
    get :show, id: @medium_map_cell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_map_cell
    assert_response :success
  end

  test "should update medium_map_cell" do
    put :update, id: @medium_map_cell, medium_map_cell: @medium_map_cell.attributes
    assert_redirected_to medium_map_cell_path(assigns(:medium_map_cell))
  end

  test "should destroy medium_map_cell" do
    assert_difference('MediumMapCell.count', -1) do
      delete :destroy, id: @medium_map_cell
    end

    assert_redirected_to medium_map_cells_path
  end
end
