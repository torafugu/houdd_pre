require 'test_helper'

class MediumBodyPartsControllerTest < ActionController::TestCase
  setup do
    @medium_body_part = medium_body_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_body_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_body_part" do
    assert_difference('MediumBodyPart.count') do
      post :create, medium_body_part: @medium_body_part.attributes
    end

    assert_redirected_to medium_body_part_path(assigns(:medium_body_part))
  end

  test "should show medium_body_part" do
    get :show, id: @medium_body_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_body_part
    assert_response :success
  end

  test "should update medium_body_part" do
    put :update, id: @medium_body_part, medium_body_part: @medium_body_part.attributes
    assert_redirected_to medium_body_part_path(assigns(:medium_body_part))
  end

  test "should destroy medium_body_part" do
    assert_difference('MediumBodyPart.count', -1) do
      delete :destroy, id: @medium_body_part
    end

    assert_redirected_to medium_body_parts_path
  end
end
