require 'test_helper'

class MediumHouddUsersControllerTest < ActionController::TestCase
  setup do
    @medium_houdd_user = medium_houdd_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_houdd_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_houdd_user" do
    assert_difference('MediumHouddUser.count') do
      post :create, medium_houdd_user: @medium_houdd_user.attributes
    end

    assert_redirected_to medium_houdd_user_path(assigns(:medium_houdd_user))
  end

  test "should show medium_houdd_user" do
    get :show, id: @medium_houdd_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_houdd_user
    assert_response :success
  end

  test "should update medium_houdd_user" do
    put :update, id: @medium_houdd_user, medium_houdd_user: @medium_houdd_user.attributes
    assert_redirected_to medium_houdd_user_path(assigns(:medium_houdd_user))
  end

  test "should destroy medium_houdd_user" do
    assert_difference('MediumHouddUser.count', -1) do
      delete :destroy, id: @medium_houdd_user
    end

    assert_redirected_to medium_houdd_users_path
  end
end
