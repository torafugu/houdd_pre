require 'test_helper'

class MediumResourcesControllerTest < ActionController::TestCase
  setup do
    @medium_resource = medium_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_resource" do
    assert_difference('MediumResource.count') do
      post :create, medium_resource: @medium_resource.attributes
    end

    assert_redirected_to medium_resource_path(assigns(:medium_resource))
  end

  test "should show medium_resource" do
    get :show, id: @medium_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_resource
    assert_response :success
  end

  test "should update medium_resource" do
    put :update, id: @medium_resource, medium_resource: @medium_resource.attributes
    assert_redirected_to medium_resource_path(assigns(:medium_resource))
  end

  test "should destroy medium_resource" do
    assert_difference('MediumResource.count', -1) do
      delete :destroy, id: @medium_resource
    end

    assert_redirected_to medium_resources_path
  end
end
