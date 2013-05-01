require 'test_helper'

class MediumConstructionsControllerTest < ActionController::TestCase
  setup do
    @medium_construction = medium_constructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_constructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_construction" do
    assert_difference('MediumConstruction.count') do
      post :create, medium_construction: @medium_construction.attributes
    end

    assert_redirected_to medium_construction_path(assigns(:medium_construction))
  end

  test "should show medium_construction" do
    get :show, id: @medium_construction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_construction
    assert_response :success
  end

  test "should update medium_construction" do
    put :update, id: @medium_construction, medium_construction: @medium_construction.attributes
    assert_redirected_to medium_construction_path(assigns(:medium_construction))
  end

  test "should destroy medium_construction" do
    assert_difference('MediumConstruction.count', -1) do
      delete :destroy, id: @medium_construction
    end

    assert_redirected_to medium_constructions_path
  end
end
