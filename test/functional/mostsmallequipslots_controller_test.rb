require 'test_helper'

class MostsmallequipslotsControllerTest < ActionController::TestCase
  setup do
    @mostsmallequipslot = mostsmallequipslots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallequipslots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallequipslot" do
    assert_difference('Mostsmallequipslot.count') do
      post :create, mostsmallequipslot: @mostsmallequipslot.attributes
    end

    assert_redirected_to mostsmallequipslot_path(assigns(:mostsmallequipslot))
  end

  test "should show mostsmallequipslot" do
    get :show, id: @mostsmallequipslot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallequipslot
    assert_response :success
  end

  test "should update mostsmallequipslot" do
    put :update, id: @mostsmallequipslot, mostsmallequipslot: @mostsmallequipslot.attributes
    assert_redirected_to mostsmallequipslot_path(assigns(:mostsmallequipslot))
  end

  test "should destroy mostsmallequipslot" do
    assert_difference('Mostsmallequipslot.count', -1) do
      delete :destroy, id: @mostsmallequipslot
    end

    assert_redirected_to mostsmallequipslots_path
  end
end
