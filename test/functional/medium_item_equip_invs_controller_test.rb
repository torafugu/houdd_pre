require 'test_helper'

class MediumItemEquipInvsControllerTest < ActionController::TestCase
  setup do
    @medium_item_equip_inv = medium_item_equip_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_item_equip_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_item_equip_inv" do
    assert_difference('MediumItemEquipInv.count') do
      post :create, medium_item_equip_inv: @medium_item_equip_inv.attributes
    end

    assert_redirected_to medium_item_equip_inv_path(assigns(:medium_item_equip_inv))
  end

  test "should show medium_item_equip_inv" do
    get :show, id: @medium_item_equip_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_item_equip_inv
    assert_response :success
  end

  test "should update medium_item_equip_inv" do
    put :update, id: @medium_item_equip_inv, medium_item_equip_inv: @medium_item_equip_inv.attributes
    assert_redirected_to medium_item_equip_inv_path(assigns(:medium_item_equip_inv))
  end

  test "should destroy medium_item_equip_inv" do
    assert_difference('MediumItemEquipInv.count', -1) do
      delete :destroy, id: @medium_item_equip_inv
    end

    assert_redirected_to medium_item_equip_invs_path
  end
end
