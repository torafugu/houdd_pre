require 'test_helper'

class MediumSpeciesControllerTest < ActionController::TestCase
  setup do
    @medium_specy = medium_species(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_species)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_specy" do
    assert_difference('MediumSpecie.count') do
      post :create, medium_specy: @medium_specy.attributes
    end

    assert_redirected_to medium_specy_path(assigns(:medium_specy))
  end

  test "should show medium_specy" do
    get :show, id: @medium_specy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_specy
    assert_response :success
  end

  test "should update medium_specy" do
    put :update, id: @medium_specy, medium_specy: @medium_specy.attributes
    assert_redirected_to medium_specy_path(assigns(:medium_specy))
  end

  test "should destroy medium_specy" do
    assert_difference('MediumSpecie.count', -1) do
      delete :destroy, id: @medium_specy
    end

    assert_redirected_to medium_species_path
  end
end
