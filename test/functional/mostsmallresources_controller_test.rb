require 'test_helper'

class MostsmallresourcesControllerTest < ActionController::TestCase
  setup do
    @mostsmallresource = mostsmallresources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallresources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallresource" do
    assert_difference('Mostsmallresource.count') do
      post :create, mostsmallresource: @mostsmallresource.attributes
    end

    assert_redirected_to mostsmallresource_path(assigns(:mostsmallresource))
  end

  test "should show mostsmallresource" do
    get :show, id: @mostsmallresource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallresource
    assert_response :success
  end

  test "should update mostsmallresource" do
    put :update, id: @mostsmallresource, mostsmallresource: @mostsmallresource.attributes
    assert_redirected_to mostsmallresource_path(assigns(:mostsmallresource))
  end

  test "should destroy mostsmallresource" do
    assert_difference('Mostsmallresource.count', -1) do
      delete :destroy, id: @mostsmallresource
    end

    assert_redirected_to mostsmallresources_path
  end
end
