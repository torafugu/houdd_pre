require 'test_helper'

class MostsmallresearchesControllerTest < ActionController::TestCase
  setup do
    @mostsmallresearch = mostsmallresearches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallresearches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallresearch" do
    assert_difference('Mostsmallresearch.count') do
      post :create, mostsmallresearch: @mostsmallresearch.attributes
    end

    assert_redirected_to mostsmallresearch_path(assigns(:mostsmallresearch))
  end

  test "should show mostsmallresearch" do
    get :show, id: @mostsmallresearch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallresearch
    assert_response :success
  end

  test "should update mostsmallresearch" do
    put :update, id: @mostsmallresearch, mostsmallresearch: @mostsmallresearch.attributes
    assert_redirected_to mostsmallresearch_path(assigns(:mostsmallresearch))
  end

  test "should destroy mostsmallresearch" do
    assert_difference('Mostsmallresearch.count', -1) do
      delete :destroy, id: @mostsmallresearch
    end

    assert_redirected_to mostsmallresearches_path
  end
end
