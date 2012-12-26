require 'test_helper'

class SmalltrialsControllerTest < ActionController::TestCase
  setup do
    @smalltrial = smalltrials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smalltrials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smalltrial" do
    assert_difference('Smalltrial.count') do
      post :create, smalltrial: @smalltrial.attributes
    end

    assert_redirected_to smalltrial_path(assigns(:smalltrial))
  end

  test "should show smalltrial" do
    get :show, id: @smalltrial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smalltrial
    assert_response :success
  end

  test "should update smalltrial" do
    put :update, id: @smalltrial, smalltrial: @smalltrial.attributes
    assert_redirected_to smalltrial_path(assigns(:smalltrial))
  end

  test "should destroy smalltrial" do
    assert_difference('Smalltrial.count', -1) do
      delete :destroy, id: @smalltrial
    end

    assert_redirected_to smalltrials_path
  end
end
