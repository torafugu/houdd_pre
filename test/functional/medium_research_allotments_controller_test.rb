require 'test_helper'

class MediumResearchAllotmentsControllerTest < ActionController::TestCase
  setup do
    @medium_research_allotment = medium_research_allotments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_research_allotments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_research_allotment" do
    assert_difference('MediumResearchAllotment.count') do
      post :create, medium_research_allotment: @medium_research_allotment.attributes
    end

    assert_redirected_to medium_research_allotment_path(assigns(:medium_research_allotment))
  end

  test "should show medium_research_allotment" do
    get :show, id: @medium_research_allotment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_research_allotment
    assert_response :success
  end

  test "should update medium_research_allotment" do
    put :update, id: @medium_research_allotment, medium_research_allotment: @medium_research_allotment.attributes
    assert_redirected_to medium_research_allotment_path(assigns(:medium_research_allotment))
  end

  test "should destroy medium_research_allotment" do
    assert_difference('MediumResearchAllotment.count', -1) do
      delete :destroy, id: @medium_research_allotment
    end

    assert_redirected_to medium_research_allotments_path
  end
end
