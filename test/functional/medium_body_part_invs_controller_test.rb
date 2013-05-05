require 'test_helper'

class MediumBodyPartInvsControllerTest < ActionController::TestCase
  setup do
    @medium_body_part_inv = medium_body_part_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_body_part_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_body_part_inv" do
    assert_difference('MediumBodyPartInv.count') do
      post :create, medium_body_part_inv: @medium_body_part_inv.attributes
    end

    assert_redirected_to medium_body_part_inv_path(assigns(:medium_body_part_inv))
  end

  test "should show medium_body_part_inv" do
    get :show, id: @medium_body_part_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_body_part_inv
    assert_response :success
  end

  test "should update medium_body_part_inv" do
    put :update, id: @medium_body_part_inv, medium_body_part_inv: @medium_body_part_inv.attributes
    assert_redirected_to medium_body_part_inv_path(assigns(:medium_body_part_inv))
  end

  test "should destroy medium_body_part_inv" do
    assert_difference('MediumBodyPartInv.count', -1) do
      delete :destroy, id: @medium_body_part_inv
    end

    assert_redirected_to medium_body_part_invs_path
  end
end
