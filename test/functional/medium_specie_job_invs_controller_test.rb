require 'test_helper'

class MediumSpecieJobInvsControllerTest < ActionController::TestCase
  setup do
    @medium_specie_job_inv = medium_specie_job_invs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_specie_job_invs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_specie_job_inv" do
    assert_difference('MediumSpecieJobInv.count') do
      post :create, medium_specie_job_inv: @medium_specie_job_inv.attributes
    end

    assert_redirected_to medium_specie_job_inv_path(assigns(:medium_specie_job_inv))
  end

  test "should show medium_specie_job_inv" do
    get :show, id: @medium_specie_job_inv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_specie_job_inv
    assert_response :success
  end

  test "should update medium_specie_job_inv" do
    put :update, id: @medium_specie_job_inv, medium_specie_job_inv: @medium_specie_job_inv.attributes
    assert_redirected_to medium_specie_job_inv_path(assigns(:medium_specie_job_inv))
  end

  test "should destroy medium_specie_job_inv" do
    assert_difference('MediumSpecieJobInv.count', -1) do
      delete :destroy, id: @medium_specie_job_inv
    end

    assert_redirected_to medium_specie_job_invs_path
  end
end
