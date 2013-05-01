require 'test_helper'

class MediumConstNecResInvsControllerTest < ActionController::TestCase
  setup do
    @medium_const_nec_res_inv = medium_const_nec_res_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_const_nec_res_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_const_nec_res_inv" do
    assert_difference('MediumConstNecResInv.count') do
      post :create, medium_const_nec_res_inv: @medium_const_nec_res_inv.attributes
    end

    assert_redirected_to medium_const_nec_res_inv_path(assigns(:medium_const_nec_res_inv))
  end

  test "should show medium_const_nec_res_inv" do
    get :show, id: @medium_const_nec_res_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_const_nec_res_inv
    assert_response :success
  end

  test "should update medium_const_nec_res_inv" do
    put :update, id: @medium_const_nec_res_inv, medium_const_nec_res_inv: @medium_const_nec_res_inv.attributes
    assert_redirected_to medium_const_nec_res_inv_path(assigns(:medium_const_nec_res_inv))
  end

  test "should destroy medium_const_nec_res_inv" do
    assert_difference('MediumConstNecResInv.count', -1) do
      delete :destroy, id: @medium_const_nec_res_inv
    end

    assert_redirected_to medium_const_nec_res_invs_path
  end
end
