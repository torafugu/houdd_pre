require 'test_helper'

class MostsmalltraplvltblsControllerTest < ActionController::TestCase
  setup do
    @mostsmalltraplvltbl = mostsmalltraplvltbls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmalltraplvltbls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmalltraplvltbl" do
    assert_difference('Mostsmalltraplvltbl.count') do
      post :create, mostsmalltraplvltbl: @mostsmalltraplvltbl.attributes
    end

    assert_redirected_to mostsmalltraplvltbl_path(assigns(:mostsmalltraplvltbl))
  end

  test "should show mostsmalltraplvltbl" do
    get :show, id: @mostsmalltraplvltbl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmalltraplvltbl
    assert_response :success
  end

  test "should update mostsmalltraplvltbl" do
    put :update, id: @mostsmalltraplvltbl, mostsmalltraplvltbl: @mostsmalltraplvltbl.attributes
    assert_redirected_to mostsmalltraplvltbl_path(assigns(:mostsmalltraplvltbl))
  end

  test "should destroy mostsmalltraplvltbl" do
    assert_difference('Mostsmalltraplvltbl.count', -1) do
      delete :destroy, id: @mostsmalltraplvltbl
    end

    assert_redirected_to mostsmalltraplvltbls_path
  end
end
