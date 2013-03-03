require 'test_helper'

class MostsmallskilllvltblsControllerTest < ActionController::TestCase
  setup do
    @mostsmallskilllvltbl = mostsmallskilllvltbls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallskilllvltbls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallskilllvltbl" do
    assert_difference('Mostsmallskilllvltbl.count') do
      post :create, mostsmallskilllvltbl: @mostsmallskilllvltbl.attributes
    end

    assert_redirected_to mostsmallskilllvltbl_path(assigns(:mostsmallskilllvltbl))
  end

  test "should show mostsmallskilllvltbl" do
    get :show, id: @mostsmallskilllvltbl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallskilllvltbl
    assert_response :success
  end

  test "should update mostsmallskilllvltbl" do
    put :update, id: @mostsmallskilllvltbl, mostsmallskilllvltbl: @mostsmallskilllvltbl.attributes
    assert_redirected_to mostsmallskilllvltbl_path(assigns(:mostsmallskilllvltbl))
  end

  test "should destroy mostsmallskilllvltbl" do
    assert_difference('Mostsmallskilllvltbl.count', -1) do
      delete :destroy, id: @mostsmallskilllvltbl
    end

    assert_redirected_to mostsmallskilllvltbls_path
  end
end
