require 'test_helper'

class MostsmallterrainsControllerTest < ActionController::TestCase
  setup do
    @mostsmallterrain = mostsmallterrains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallterrains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallterrain" do
    assert_difference('Mostsmallterrain.count') do
      post :create, mostsmallterrain: @mostsmallterrain.attributes
    end

    assert_redirected_to mostsmallterrain_path(assigns(:mostsmallterrain))
  end

  test "should show mostsmallterrain" do
    get :show, id: @mostsmallterrain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallterrain
    assert_response :success
  end

  test "should update mostsmallterrain" do
    put :update, id: @mostsmallterrain, mostsmallterrain: @mostsmallterrain.attributes
    assert_redirected_to mostsmallterrain_path(assigns(:mostsmallterrain))
  end

  test "should destroy mostsmallterrain" do
    assert_difference('Mostsmallterrain.count', -1) do
      delete :destroy, id: @mostsmallterrain
    end

    assert_redirected_to mostsmallterrains_path
  end
end
