require 'test_helper'

class MostsmallmoblvltblsControllerTest < ActionController::TestCase
  setup do
    @mostsmallmoblvltbl = mostsmallmoblvltbls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmoblvltbls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmoblvltbl" do
    assert_difference('Mostsmallmoblvltbl.count') do
      post :create, mostsmallmoblvltbl: @mostsmallmoblvltbl.attributes
    end

    assert_redirected_to mostsmallmoblvltbl_path(assigns(:mostsmallmoblvltbl))
  end

  test "should show mostsmallmoblvltbl" do
    get :show, id: @mostsmallmoblvltbl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmoblvltbl
    assert_response :success
  end

  test "should update mostsmallmoblvltbl" do
    put :update, id: @mostsmallmoblvltbl, mostsmallmoblvltbl: @mostsmallmoblvltbl.attributes
    assert_redirected_to mostsmallmoblvltbl_path(assigns(:mostsmallmoblvltbl))
  end

  test "should destroy mostsmallmoblvltbl" do
    assert_difference('Mostsmallmoblvltbl.count', -1) do
      delete :destroy, id: @mostsmallmoblvltbl
    end

    assert_redirected_to mostsmallmoblvltbls_path
  end
end
