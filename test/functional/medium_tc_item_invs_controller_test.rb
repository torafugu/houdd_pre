require 'test_helper'

class MediumTcItemInvsControllerTest < ActionController::TestCase
  setup do
    @medium_tc_item_inv = medium_tc_item_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_tc_item_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_tc_item_inv" do
    assert_difference('MediumTcItemInv.count') do
      post :create, medium_tc_item_inv: @medium_tc_item_inv.attributes
    end

    assert_redirected_to medium_tc_item_inv_path(assigns(:medium_tc_item_inv))
  end

  test "should show medium_tc_item_inv" do
    get :show, id: @medium_tc_item_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_tc_item_inv
    assert_response :success
  end

  test "should update medium_tc_item_inv" do
    put :update, id: @medium_tc_item_inv, medium_tc_item_inv: @medium_tc_item_inv.attributes
    assert_redirected_to medium_tc_item_inv_path(assigns(:medium_tc_item_inv))
  end

  test "should destroy medium_tc_item_inv" do
    assert_difference('MediumTcItemInv.count', -1) do
      delete :destroy, id: @medium_tc_item_inv
    end

    assert_redirected_to medium_tc_item_invs_path
  end
end
