require 'test_helper'

class MostsmallconstructionfamiliesControllerTest < ActionController::TestCase
  setup do
    @mostsmallconstructionfamily = mostsmallconstructionfamilies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallconstructionfamilies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallconstructionfamily" do
    assert_difference('Mostsmallconstructionfamily.count') do
      post :create, mostsmallconstructionfamily: @mostsmallconstructionfamily.attributes
    end

    assert_redirected_to mostsmallconstructionfamily_path(assigns(:mostsmallconstructionfamily))
  end

  test "should show mostsmallconstructionfamily" do
    get :show, id: @mostsmallconstructionfamily
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallconstructionfamily
    assert_response :success
  end

  test "should update mostsmallconstructionfamily" do
    put :update, id: @mostsmallconstructionfamily, mostsmallconstructionfamily: @mostsmallconstructionfamily.attributes
    assert_redirected_to mostsmallconstructionfamily_path(assigns(:mostsmallconstructionfamily))
  end

  test "should destroy mostsmallconstructionfamily" do
    assert_difference('Mostsmallconstructionfamily.count', -1) do
      delete :destroy, id: @mostsmallconstructionfamily
    end

    assert_redirected_to mostsmallconstructionfamilies_path
  end
end
