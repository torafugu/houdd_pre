require 'test_helper'

class MediumStatusModsControllerTest < ActionController::TestCase
  setup do
    @medium_status_mod = medium_status_mods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_status_mods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_status_mod" do
    assert_difference('MediumStatusMod.count') do
      post :create, medium_status_mod: @medium_status_mod.attributes
    end

    assert_redirected_to medium_status_mod_path(assigns(:medium_status_mod))
  end

  test "should show medium_status_mod" do
    get :show, id: @medium_status_mod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_status_mod
    assert_response :success
  end

  test "should update medium_status_mod" do
    put :update, id: @medium_status_mod, medium_status_mod: @medium_status_mod.attributes
    assert_redirected_to medium_status_mod_path(assigns(:medium_status_mod))
  end

  test "should destroy medium_status_mod" do
    assert_difference('MediumStatusMod.count', -1) do
      delete :destroy, id: @medium_status_mod
    end

    assert_redirected_to medium_status_mods_path
  end
end
