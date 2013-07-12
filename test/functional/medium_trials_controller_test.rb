require 'test_helper'

class MediumTrialsControllerTest < ActionController::TestCase
  setup do
    @medium_trial = medium_trials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_trials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_trial" do
    assert_difference('MediumTrial.count') do
      post :create, medium_trial: @medium_trial.attributes
    end

    assert_redirected_to medium_trial_path(assigns(:medium_trial))
  end

  test "should show medium_trial" do
    get :show, id: @medium_trial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_trial
    assert_response :success
  end

  test "should update medium_trial" do
    put :update, id: @medium_trial, medium_trial: @medium_trial.attributes
    assert_redirected_to medium_trial_path(assigns(:medium_trial))
  end

  test "should destroy medium_trial" do
    assert_difference('MediumTrial.count', -1) do
      delete :destroy, id: @medium_trial
    end

    assert_redirected_to medium_trials_path
  end
end
