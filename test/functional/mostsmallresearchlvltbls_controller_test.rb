require 'test_helper'

class MostsmallresearchlvltblsControllerTest < ActionController::TestCase
  setup do
    @mostsmallresearchlvltbl = mostsmallresearchlvltbls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallresearchlvltbls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallresearchlvltbl" do
    assert_difference('Mostsmallresearchlvltbl.count') do
      post :create, mostsmallresearchlvltbl: @mostsmallresearchlvltbl.attributes
    end

    assert_redirected_to mostsmallresearchlvltbl_path(assigns(:mostsmallresearchlvltbl))
  end

  test "should show mostsmallresearchlvltbl" do
    get :show, id: @mostsmallresearchlvltbl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallresearchlvltbl
    assert_response :success
  end

  test "should update mostsmallresearchlvltbl" do
    put :update, id: @mostsmallresearchlvltbl, mostsmallresearchlvltbl: @mostsmallresearchlvltbl.attributes
    assert_redirected_to mostsmallresearchlvltbl_path(assigns(:mostsmallresearchlvltbl))
  end

  test "should destroy mostsmallresearchlvltbl" do
    assert_difference('Mostsmallresearchlvltbl.count', -1) do
      delete :destroy, id: @mostsmallresearchlvltbl
    end

    assert_redirected_to mostsmallresearchlvltbls_path
  end
end
