require 'test_helper'

class MediumMobsControllerTest < ActionController::TestCase
  setup do
    @medium_mob = medium_mobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_mobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_mob" do
    assert_difference('MediumMob.count') do
      post :create, medium_mob: @medium_mob.attributes
    end

    assert_redirected_to medium_mob_path(assigns(:medium_mob))
  end

  test "should show medium_mob" do
    get :show, id: @medium_mob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_mob
    assert_response :success
  end

  test "should update medium_mob" do
    put :update, id: @medium_mob, medium_mob: @medium_mob.attributes
    assert_redirected_to medium_mob_path(assigns(:medium_mob))
  end

  test "should destroy medium_mob" do
    assert_difference('MediumMob.count', -1) do
      delete :destroy, id: @medium_mob
    end

    assert_redirected_to medium_mobs_path
  end
end
