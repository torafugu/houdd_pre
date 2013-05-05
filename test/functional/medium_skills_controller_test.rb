require 'test_helper'

class MediumSkillsControllerTest < ActionController::TestCase
  setup do
    @medium_skill = medium_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_skill" do
    assert_difference('MediumSkill.count') do
      post :create, medium_skill: @medium_skill.attributes
    end

    assert_redirected_to medium_skill_path(assigns(:medium_skill))
  end

  test "should show medium_skill" do
    get :show, id: @medium_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_skill
    assert_response :success
  end

  test "should update medium_skill" do
    put :update, id: @medium_skill, medium_skill: @medium_skill.attributes
    assert_redirected_to medium_skill_path(assigns(:medium_skill))
  end

  test "should destroy medium_skill" do
    assert_difference('MediumSkill.count', -1) do
      delete :destroy, id: @medium_skill
    end

    assert_redirected_to medium_skills_path
  end
end
