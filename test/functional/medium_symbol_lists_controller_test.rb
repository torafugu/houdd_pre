require 'test_helper'

class MediumSymbolListsControllerTest < ActionController::TestCase
  setup do
    @medium_symbol_list = medium_symbol_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_symbol_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_symbol_list" do
    assert_difference('MediumSymbolList.count') do
      post :create, medium_symbol_list: @medium_symbol_list.attributes
    end

    assert_redirected_to medium_symbol_list_path(assigns(:medium_symbol_list))
  end

  test "should show medium_symbol_list" do
    get :show, id: @medium_symbol_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_symbol_list
    assert_response :success
  end

  test "should update medium_symbol_list" do
    put :update, id: @medium_symbol_list, medium_symbol_list: @medium_symbol_list.attributes
    assert_redirected_to medium_symbol_list_path(assigns(:medium_symbol_list))
  end

  test "should destroy medium_symbol_list" do
    assert_difference('MediumSymbolList.count', -1) do
      delete :destroy, id: @medium_symbol_list
    end

    assert_redirected_to medium_symbol_lists_path
  end
end
