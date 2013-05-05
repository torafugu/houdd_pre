require 'test_helper'

class MediumJobsControllerTest < ActionController::TestCase
  setup do
    @medium_job = medium_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_job" do
    assert_difference('MediumJob.count') do
      post :create, medium_job: @medium_job.attributes
    end

    assert_redirected_to medium_job_path(assigns(:medium_job))
  end

  test "should show medium_job" do
    get :show, id: @medium_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_job
    assert_response :success
  end

  test "should update medium_job" do
    put :update, id: @medium_job, medium_job: @medium_job.attributes
    assert_redirected_to medium_job_path(assigns(:medium_job))
  end

  test "should destroy medium_job" do
    assert_difference('MediumJob.count', -1) do
      delete :destroy, id: @medium_job
    end

    assert_redirected_to medium_jobs_path
  end
end
