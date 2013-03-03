require 'test_helper'

class MostsmallskillsControllerTest < ActionController::TestCase
  setup do
    @mostsmallskill = mostsmallskills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallskills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallskill" do
    assert_difference('Mostsmallskill.count') do
      post :create, mostsmallskill: @mostsmallskill.attributes
    end

    assert_redirected_to mostsmallskill_path(assigns(:mostsmallskill))
  end

  test "should show mostsmallskill" do
    get :show, id: @mostsmallskill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallskill
    assert_response :success
  end

  test "should update mostsmallskill" do
    put :update, id: @mostsmallskill, mostsmallskill: @mostsmallskill.attributes
    assert_redirected_to mostsmallskill_path(assigns(:mostsmallskill))
  end

  test "should destroy mostsmallskill" do
    assert_difference('Mostsmallskill.count', -1) do
      delete :destroy, id: @mostsmallskill
    end

    assert_redirected_to mostsmallskills_path
  end
end
