require 'test_helper'

class MediumSkillExpInvsControllerTest < ActionController::TestCase
  setup do
    @medium_skill_exp_inv = medium_skill_exp_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_skill_exp_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_skill_exp_inv" do
    assert_difference('MediumSkillExpInv.count') do
      post :create, medium_skill_exp_inv: @medium_skill_exp_inv.attributes
    end

    assert_redirected_to medium_skill_exp_inv_path(assigns(:medium_skill_exp_inv))
  end

  test "should show medium_skill_exp_inv" do
    get :show, id: @medium_skill_exp_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_skill_exp_inv
    assert_response :success
  end

  test "should update medium_skill_exp_inv" do
    put :update, id: @medium_skill_exp_inv, medium_skill_exp_inv: @medium_skill_exp_inv.attributes
    assert_redirected_to medium_skill_exp_inv_path(assigns(:medium_skill_exp_inv))
  end

  test "should destroy medium_skill_exp_inv" do
    assert_difference('MediumSkillExpInv.count', -1) do
      delete :destroy, id: @medium_skill_exp_inv
    end

    assert_redirected_to medium_skill_exp_invs_path
  end
end
