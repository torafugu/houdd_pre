require 'test_helper'

class MediumFamiliesControllerTest < ActionController::TestCase
  setup do
    @medium_family = medium_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_family" do
    assert_difference('MediumFamily.count') do
      post :create, medium_family: @medium_family.attributes
    end

    assert_redirected_to medium_family_path(assigns(:medium_family))
  end

  test "should show medium_family" do
    get :show, id: @medium_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_family
    assert_response :success
  end

  test "should update medium_family" do
    put :update, id: @medium_family, medium_family: @medium_family.attributes
    assert_redirected_to medium_family_path(assigns(:medium_family))
  end

  test "should destroy medium_family" do
    assert_difference('MediumFamily.count', -1) do
      delete :destroy, id: @medium_family
    end

    assert_redirected_to medium_families_path
  end
end
