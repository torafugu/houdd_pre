require 'test_helper'

class MediumSquadsControllerTest < ActionController::TestCase
  setup do
    @medium_squad = medium_squads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_squads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_squad" do
    assert_difference('MediumSquad.count') do
      post :create, medium_squad: @medium_squad.attributes
    end

    assert_redirected_to medium_squad_path(assigns(:medium_squad))
  end

  test "should show medium_squad" do
    get :show, id: @medium_squad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_squad
    assert_response :success
  end

  test "should update medium_squad" do
    put :update, id: @medium_squad, medium_squad: @medium_squad.attributes
    assert_redirected_to medium_squad_path(assigns(:medium_squad))
  end

  test "should destroy medium_squad" do
    assert_difference('MediumSquad.count', -1) do
      delete :destroy, id: @medium_squad
    end

    assert_redirected_to medium_squads_path
  end
end
